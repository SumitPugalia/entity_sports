defmodule EntitySports do
  @moduledoc """
  EntitySports API client interface
  """
  alias EntitySports.Model.Requests.{CreateOrder, GetTransaction}
  alias EntitySports.Utils

  require Logger

  @client_module Application.compile_env(:entity_sports, :client_module)

  @type error :: {:error, Ecto.Changeset.t()}

  # callbacks
  @callback create_order(signed_request :: String.t(), jws_header :: String.t()) ::
              {:ok, any()} | {:error, any()}
  @callback get_transaction(signed_request :: String.t(), jws_header :: String.t()) ::
              {:ok, any()} | {:error, any()}

  @doc """
  create order (payment + mandate)
  """
  @spec create_order(request :: map()) :: {:ok, any()} | error()
  def create_order(request) do
    order_id = Map.get(request, "orderid")

    with jws_header <- create_header(order_id),
         {:ok, jws_payload} <- create_order_payload(request),
         {%{alg: :jose_jws_alg_hmac}, signed_request} <-
           Utils.encrypt_and_sign_JWS_with_HMAC(jws_header, jws_payload) do
      @client_module.create_order(signed_request, jws_header)
    end
  end

  @spec get_transaction(request :: map()) :: {:ok, any()} | error()
  def get_transaction(request) do
    order_id = Map.get(request, "orderid")

    with jws_header <- create_header("#{order_id}-#{System.os_time(:second)}"),
         {:ok, jws_payload} <- get_transaction_payload(request),
         {%{alg: :jose_jws_alg_hmac}, signed_request} <-
           Utils.encrypt_and_sign_JWS_with_HMAC(jws_header, jws_payload) do
      @client_module.get_transaction(signed_request, jws_header)
    end
  end

  defp create_header(order_id),
    do: %{
      "alg" => "HS256",
      "clientid" => @client_id,
      "Content-type" => "application/jose",
      "bd-timestamp" => "#{System.os_time(:second)}",
      "accept" => "application/jose",
      "bd-traceid" => "#{order_id}-#{System.os_time(:second)}-trace"
    }

  defp create_order_payload(request),
    do: request |> CreateOrder.changeset() |> create_payload()

  defp get_transaction_payload(request),
    do: request |> GetTransaction.changeset() |> create_payload()

  defp create_payload({:ok, model}),
    do:
      {:ok,
       model
       |> Map.from_struct()
       |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
       |> Enum.map(fn {k, v} -> {Atom.to_string(k), v} end)
       |> Enum.into(%{})}

  defp create_payload(error), do: error
end

