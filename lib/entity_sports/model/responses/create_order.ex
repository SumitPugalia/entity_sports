defmodule EntitySports.Model.Responses.CreateOrder do
  @moduledoc """
  Create Order response body model
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias EntitySports.Model.{AdditionalInfo, Customer, Device, Invoice, Mandate, Link}
  alias EntitySports.Model.Responses.CreateOrder

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:objectid, :string)
    field(:orderid, :string)
    field(:bdorderid, :string)
    field(:mercid, :string)
    field(:order_date, :utc_datetime)
    field(:amount, :string)
    field(:currency, :string)
    field(:ru, :string)
    field(:itemcode, :string)
    field(:status, :string)

    embeds_one(:additional_info, AdditionalInfo)
    embeds_one(:customer, Customer)
    embeds_one(:device, Device)
    embeds_one(:mandate, Mandate)
    embeds_one(:invoice, Invoice)
    embeds_many(:links, Link)
  end

  @fields [
    :objectid,
    :orderid,
    :bdorderid,
    :mercid,
    :order_date,
    :amount,
    :currency,
    :ru,
    :itemcode,
    :status
  ]

  def changeset(params) do
    changeset(%CreateOrder{}, params)
  end

  def changeset(create_order, params) do
    create_order
    |> cast(params, @fields)
    |> cast_embed(:additional_info)
    |> cast_embed(:customer)
    |> cast_embed(:device)
    |> cast_embed(:mandate)
    |> cast_embed(:invoice)
    |> cast_embed(:links)
    |> apply_action(nil)
  end
end
