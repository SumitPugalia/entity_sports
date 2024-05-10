defmodule EntitySports.Model.Responses.CreateTransaction do
  @moduledoc """
  Create Transaction response body model
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias EntitySports.Model.{AdditionalInfo, Card, Customer, Mandate}
  alias EntitySports.Model.Responses.CreateTransaction

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:objectid, :string)
    field(:transactionid, :string)
    field(:mercid, :string)
    field(:orderid, :string)
    field(:transaction_date, :utc_datetime)
    field(:amount, :string)
    field(:surcharge, :string)
    field(:discount, :string)
    field(:charge_amount, :string)
    field(:currency, :string)
    field(:txn_process_type, :string)
    field(:bankid, :string)
    field(:itemcode, :string)
    field(:bank_ref_no, :string)
    field(:auth_status, :string)
    field(:transaction_error_code, :string)
    field(:transaction_error_desc, :string)
    field(:transaction_error_type, :string)
    field(:authcode, :string)
    field(:eci, :string)
    field(:payment_method_type, :string)

    embeds_one(:mandate, Mandate)
    embeds_one(:additional_info, AdditionalInfo)
    embeds_one(:card, Card)
    embeds_one(:customer, Customer)
  end

  @fields [
    :objectid,
    :transactionid,
    :mercid,
    :orderid,
    :transaction_date,
    :amount,
    :surcharge,
    :discount,
    :charge_amount,
    :currency,
    :txn_process_type,
    :bankid,
    :itemcode,
    :bank_ref_no,
    :auth_status,
    :transaction_error_code,
    :transaction_error_desc,
    :transaction_error_type,
    :authcode,
    :eci,
    :payment_method_type
  ]

  def changeset(params) do
    changeset(%CreateTransaction{}, params)
  end

  def changeset(create_transaction, params) do
    create_transaction
    |> cast(params, @fields)
    |> cast_embed(:additional_info)
    |> cast_embed(:card)
    |> cast_embed(:customer)
    |> cast_embed(:mandate)
    |> apply_action(nil)
  end
end