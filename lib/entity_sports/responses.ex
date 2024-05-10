defmodule EntitySports.Responses do
  alias EntitySports.Model.Responses.CreateOrder, as: CreateOrderResponse
  alias EntitySports.Model.Responses.CreateInvoice, as: CreateInvoiceResponse
  alias EntitySports.Model.Responses.CreateTransaction, as: CreateTransactionResponse

  def create_order_response(response) do
    case response |> CreateOrderResponse.changeset() do
      {:ok, model} ->
        links = model.links
        [link] = Enum.filter(links, fn link -> not is_nil(link.headers) end)
        token = link.headers.authorization

        {:ok,
         %{
           raw_response: response,
           token: token,
           bdorderid: model.bdorderid,
           mandate_tokenid: model.mandate && model.mandate.mandate_tokenid,
           mandate_id: model.mandate && model.mandate.mandateid
         }}

      {:error, changeset} ->
        {:error, changeset, response}
    end
  end
end
