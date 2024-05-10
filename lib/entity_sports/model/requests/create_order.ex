defmodule EntitySports.Model.Requests.CreateOrder do
  @moduledoc """
  Create Order request body model
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias EntitySports.Model.{AdditionalInfo, Customer, Device, Invoice, Mandate}
  alias EntitySports.Model.Requests.CreateOrder

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:orderid, :string)
    field(:mercid, :string)
    field(:order_date, :utc_datetime)
    field(:amount, :string)
    field(:currency, :string)
    field(:ru, :string)
    field(:itemcode, :string)
    field(:recurrence_rule, :string)
    field(:debit_day, :string)
    field(:mandate_required, :string)
    field(:settlement_lob, :string)

    embeds_one(:additional_info, AdditionalInfo)
    embeds_one(:customer, Customer)
    embeds_one(:device, Device)
    embeds_one(:mandate, Mandate)
    embeds_one(:invoice, Invoice)
  end

  @fields [
    :orderid,
    :mercid,
    :order_date,
    :amount,
    :currency,
    :ru,
    :itemcode,
    :recurrence_rule,
    :debit_day,
    :mandate_required,
    :settlement_lob
  ]

  @required_fields [
    :orderid,
    :mercid,
    :order_date,
    :amount,
    :currency,
    :ru,
    :itemcode
  ]

  def changeset(params) do
    changeset(%CreateOrder{}, params)
  end

  def changeset(create_order, params) do
    create_order
    |> cast(params, @fields)
    |> cast_embed(:additional_info)
    |> cast_embed(:customer)
    |> cast_embed(:device, required: true)
    |> cast_embed(:mandate)
    |> cast_embed(:invoice)
    |> validate_required(@required_fields)
    |> apply_action(nil)
  end
end
