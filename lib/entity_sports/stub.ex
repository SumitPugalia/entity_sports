defmodule EntitySports.Stub do
  @behaviour EntitySports

  @spec create_order(signed_request :: String.t(), jws_header :: String.t()) :: {:ok, any()}
  def create_order(_signed_request, _jws_header) do
    {:ok,
     %{
       bdorderid: unique_value("bdorderid"),
       mandate_id: nil,
       mandate_tokenid: unique_value("mandate_tokenid"),
       token: "OToken #{unique_value("token")}"
     }}
  end

  @spec get_transaction(signed_request :: String.t(), jws_header :: String.t()) :: {:ok, any()}
  def get_transaction(signed_request, _jws_header) do
    {:ok,
     %{
       transactionid: signed_request["transactionid"],
       orderid: signed_request["orderid"],
       transaction_date: DateTime.utc_now() |> DateTime.to_string(),
       auth_status: "0300",
       transaction_error_code: "TRS0000",
       transaction_error_desc: "Transaction Successful",
       transaction_error_type: "success",
       payment_method_type: "card",
       mandateid: unique_value("mandateid")
     }}
  end

  def unique_value(key), do: "#{key}-#{Ecto.UUID.generate()}"
end
