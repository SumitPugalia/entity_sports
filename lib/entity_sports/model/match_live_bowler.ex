defmodule EntitySports.Model.MatchLiveBowler do
  @moduledoc """
  Match Bowler model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:bowler_id, :integer)
    field(:overs, :float)
    field(:runs_conceded, :integer)
    field(:wickets, :integer)
    field(:maidens, :integer)
    field(:econ, :string)
  end

  @fields [
    :name,
    :bowler_id,
    :overs,
    :runs_conceded,
    :wickets,
    :maidens,
    :econ
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
