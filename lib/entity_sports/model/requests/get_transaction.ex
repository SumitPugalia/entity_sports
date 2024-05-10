defmodule EntitySports.Model.Requests.GetTransaction do
  @moduledoc """
  Get Transaction request body model
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias EntitySports.Model.Requests.GetTransaction

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:mercid, :string)
    field(:orderid, :string)
    field(:transactionid, :string)
  end

  @fields [
    :mercid,
    :orderid,
    :transactionid
  ]

  @required_fields [
    :mercid
  ]

  def changeset(params) do
    changeset(%GetTransaction{}, params)
  end

  def changeset(get_transaction, params) do
    get_transaction
    |> cast(params, @fields)
    |> validate_required(@required_fields)
    |> validate_one_of([:orderid, :transactionid])
    |> apply_action(nil)
  end

  def validate_one_of(%Ecto.Changeset{valid?: true} = changeset, fields) do
    total_found =
      Enum.reduce(fields, 0, fn field, found ->
        if get_change(changeset, field), do: found + 1, else: found
      end)

    case total_found do
      0 ->
        error = "one of " <> Enum.join(fields, ",") <> "is required"
        add_error(changeset, :mercid, error)

      1 ->
        changeset

      _ ->
        error = "only one of " <> Enum.join(fields, ",") <> " is allowed"
        add_error(changeset, :mercid, error)
    end
  end

  def validate_one_of(changeset, _), do: changeset
end
