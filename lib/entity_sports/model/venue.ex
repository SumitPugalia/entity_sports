defmodule EntitySports.Model.Venue do
  @moduledoc """
  Venue model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:venue_id, :integer)
    field(:name, :string)
    field(:location, :string)
    field(:timezone, :string)
  end

  @fields [
    :venue_id,
    :name,
    :location,
    :timezone
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
