defmodule EntitySports.Model.MatchLiveBatsmen do
  @moduledoc """
  Match Batsmen model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:batsman_id, :integer)
    field(:runs, :integer)
    field(:balls_faced, :integer)
    field(:fours, :integer)
    field(:sixes, :integer)
    field(:strike_rate, :string)
  end

  @fields [
    :name,
    :batsman_id,
    :runs,
    :balls_faced,
    :fours,
    :sixes,
    :strike_rate
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
