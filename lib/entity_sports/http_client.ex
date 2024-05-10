defmodule EntitySports.HttpClient do
  @moduledoc """
  This module contains low-level functions for interacting with the BillDesk.
  """
  @behaviour EntitySports

  alias EntitySports.Utils
  alias EntitySports.Responses

  require Logger

  @bill_desk_endpoint Application.compile_env(:entity_sports, :bill_desk_endpoint)
                      |> IO.inspect(label: "BillDesk Endpoint")
  @create_order_url @bill_desk_endpoint <> "/payments/ve1_2/orders/create"
  @get_transaction_url @bill_desk_endpoint <> "/payments/ve1_2/transactions/get"

  @spec create_order(signed_request :: String.t(), jws_header :: String.t()) ::
          {:ok, any()} | {:error, any()}
  def create_order(signed_request, jws_header) do
    response = Utils.post(@create_order_url, signed_request, jws_header)
    Utils.deserialize_response(response, &Responses.create_order_response/1)
  end

  @spec get_transaction(signed_request :: String.t(), jws_header :: String.t()) :: {:ok, any()}
  def get_transaction(signed_request, jws_header) do
    Logger.info("Transaction URL: #{inspect(@get_transaction_url)}")
    response = Utils.post(@get_transaction_url, signed_request, jws_header)
    Utils.deserialize_response(response, &Responses.create_transaction_response/1)
  end
end
