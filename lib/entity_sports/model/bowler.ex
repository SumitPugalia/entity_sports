defmodule EntitySports.Model.Bowler do
  @moduledoc """
  Bowler model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # 	bowler name
    field(:name, :string)
    # 	bowler id
    field(:bowler_id, :string)
    # 	true means bowler currently bowling, false means bowler currently not bowling
    field(:bowling, :string)

    # 	active bowler : bowling active over, last bowler : bowled previous over and empty if bowling : false
    field(:position, :string)
    # 	Number of overs bowled by bowler
    field(:overs, :string)
    # 	Number of maiden overs bowled by bowler
    field(:maidens, :string)
    # 	Number of runs conceded by bowler
    field(:runs_conceded, :string)
    # 	number of wickets taken by bowler
    field(:wickets, :string)
    # 	number of no balls bowled by bowler
    field(:noballs, :string)
    # 	number of wides bowled by bowler
    field(:wides, :string)
    # 	economy rate of bowler
    field(:econ, :string)
    # 	number of dot balls bowled by bowler
    field(:run0, :string)
  end

  @fields [
    :name,
    :bowler_id,
    :bowling,
    :position,
    :overs,
    :maidens,
    :runs_conceded,
    :wickets,
    :noballs,
    :wides,
    :econ,
    :run0
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
