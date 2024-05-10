defmodule EntitySports.Utils do
  require Logger

  @http_client_opts Application.compile_env(:entity_sports, :http_client_opts, [])
  @secret_key Application.compile_env(:entity_sports, :secret_key)
  @jwk %{"kty" => "oct", "k" => :jose_base64url.encode(@secret_key)}

  @doc """
  POSTs the given body to the given URI with an authorized request & standard
  options, logging the result.
  If a map, the body is JSON encoded before POSTing. Will raise if encoding
  fails.
  """
  @spec post(
          url :: String.t(),
          body :: String.t() | map(),
          headers :: HTTPoison.Base.headers(),
          extra_opts :: keyword()
        ) ::
          HTTPoison.Response.t()
  def post(url, body, headers, extra_opts \\ [timeout: 50_000, recv_timeout: 50_000])

  def post(url, body, headers, extra_opts) when is_binary(body) do
    response = HTTPoison.post(url, body, headers, extra_opts)

    Logger.debug(
      "POST #{inspect(url)}: #{inspect(headers)}: #{inspect(response)} : #{inspect(body)}"
    )

    response
  end

  @doc """
  Helper that deserializes a request response using the given deserializing
  function if the given `response` has a successful status. Otherwise, returns
  an error tuple instead.
  The deserializing function is skipped when there is no body; an empty string
  is returned instead.
  """
  @spec deserialize_response(response :: HTTPoison.Response.t(), (String.t() -> deserialized)) ::
          {:ok, deserialized | String.t()} | {:error, integer(), String.t()}
        when deserialized: any()

  def deserialize_response({:ok, %HTTPoison.Response{status_code: sc, body: ""}}, _deserialize_fn)
      when sc >= 200 and sc < 300 do
    {:ok, %{}}
  end

  def deserialize_response(
        {:ok, %HTTPoison.Response{status_code: sc, body: body}},
        deserialize_fn
      )
      when sc >= 200 and sc < 300 do
    {:ok, decrypted_body} = decrypt_with_HMAC(body)
    deserialize_fn.(decrypted_body)
  end

  def deserialize_response(
        {:ok, %HTTPoison.Response{status_code: status_code, body: body} = response},
        _deserialize_fn
      ) do
    {:ok, decrypted_body} = decrypt_with_HMAC(body)
    Logger.error("Error response: #{status_code}: #{body} \n Raw Response: #{inspect(response)}")
    {:error, status_code, decrypted_body}
  end

  def deserialize_response({:error, %HTTPoison.Error{} = resp}, _deserialize_fn) do
    message = Exception.message(resp)
    Logger.error("deserialize_response/2: Error response: #{message}")
    Logger.error("deserialize_response/2: Error response: #{inspect(resp)}")
    {:error, 0, message}
  end

  @doc """
  Returns an options Keyword for request functions. Merges the default options
  (from config) with the given `extra`.
  """
  @spec opts(keyword :: keyword()) :: keyword()
  def opts(extra \\ []),
    do: Keyword.merge(@http_client_opts, extra)

  @spec encrypt_and_sign_JWS_with_HMAC(jws_header :: any(), jws_payload :: any()) :: any()
  def encrypt_and_sign_JWS_with_HMAC(jws_header, jws_payload) do
    signed = JOSE.JWT.sign(@jwk, jws_header, jws_payload)
    JOSE.JWS.compact(signed)
  end

  @spec decrypt_with_HMAC(encrypted_body :: String.t()) :: map()
  def decrypt_with_HMAC(encrypted_body) do
    case JOSE.JWT.verify(@jwk, encrypted_body) do
      {verified?, %JOSE.JWT{fields: response}, %JOSE.JWS{}} ->
        if verified?, do: {:ok, response}, else: {:ok, %{}}

      {:error, error} ->
        Logger.error("Received error during decrypt_with_HMAC #{inspect(error)}")
        {:ok, %{}}
    end
  end
end
