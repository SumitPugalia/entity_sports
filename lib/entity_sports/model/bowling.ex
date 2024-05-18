defmodule EntitySports.Model.Bowling do
  @moduledoc """
  Bowling model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:match_id, :integer)
    field(:inning_id, :integer)
    field(:matches, :integer)
    field(:innings, :integer)
    field(:balls, :integer)
    field(:overs, :integer)
    field(:runs, :integer)
    field(:wickets, :integer)
    field(:bestinning, :string)
    field(:bestmatch, :string)
    field(:econ, :string)
    field(:average, :string)
    field(:strike, :string)
    field(:wicket4i, :integer)
    field(:wicket5i, :integer)
    field(:wicket10m, :integer)
    field(:hattrick, :integer)
    field(:expensive_over_runs, :integer)
  end

  @fields [
    :match_id,
    :inning_id,
    :matches,
    :innings,
    :balls,
    :overs,
    :runs,
    :wickets,
    :bestinning,
    :bestmatch,
    :econ,
    :average,
    :strike,
    :wicket4i,
    :wicket5i,
    :wicket10m,
    :hattrick,
    :expensive_over_runs
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
