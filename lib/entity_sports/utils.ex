defmodule EntitySports.Utils do
  @moduledoc """
  Utility Module
  """
  require Logger
  @http_client_opts Application.compile_env(:entity_sports, :http_client_opts, [])

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
  GET the given body to the given URI with an authorized request & standard
  options, logging the result.
  """
  @spec get(
          url :: String.t(),
          headers :: HTTPoison.Base.headers(),
          extra_opts :: keyword()
        ) ::
          HTTPoison.Response.t()
  def get(
        url,
        headers \\ [{"Content-Type", "application/json"}, {"accept", "application/json"}],
        extra_opts \\ [timeout: 50_000, recv_timeout: 50_000]
      )

  def get(url, headers, extra_opts) do
    response = HTTPoison.get(url, headers, extra_opts)

    Logger.debug("GET #{inspect(url)}: #{inspect(headers)}: #{inspect(response)}}")

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
    with {:ok, decoded_body} <- Jason.decode(body),
         {:ok, _res} <- {Map.get(decoded_body, "status") |> status(), decoded_body} do
      deserialize_fn.(Map.get(decoded_body, "response"))
    else
      {:error, %Jason.DecodeError{data: err}} -> {:error, 0, %{body: body, error: err}}
      {:error, decoded_body} -> {:error, sc, Map.get(decoded_body, "response")}
    end
  end

  def deserialize_response(
        {:ok, %HTTPoison.Response{status_code: status_code, body: body} = response},
        _deserialize_fn
      ) do
    Logger.error("Error response: #{status_code}: #{body} \n Raw Response: #{inspect(response)}")
    {:error, status_code, body}
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

  defp status("ok"), do: :ok
  defp status("error"), do: :error
end
