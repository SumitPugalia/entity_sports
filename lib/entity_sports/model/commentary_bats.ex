defmodule EntitySports.Model.CommentaryBats do
  @moduledoc """
  Match Batsmen model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:runs, :integer)
    field(:balls_faced, :integer)
    field(:fours, :integer)
    field(:sixes, :integer)
    field(:batsman_id, :integer)
  end

  @fields [
    :runs,
    :balls_faced,
    :fours,
    :sixes,
    :batsman_id
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
