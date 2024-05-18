defmodule EntitySports.Model.Toss do
  @moduledoc """
  Venue model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:text, :string)
    field(:winner, :integer)
    field(:decision, :integer)
  end

  @fields [
    :text,
    :winner,
    :decision
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
