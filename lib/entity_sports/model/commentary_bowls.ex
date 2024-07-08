defmodule EntitySports.Model.CommentaryBowls do
  @moduledoc """
  Match Batsmen model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:runs_conceded, :integer)
    field(:maidens, :integer)
    field(:wickets, :integer)
    field(:bowler_id, :integer)
    field(:overs, :integer)
  end

  @fields [
    :runs_conceded,
    :maidens,
    :wickets,
    :bowler_id,
    :overs
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
