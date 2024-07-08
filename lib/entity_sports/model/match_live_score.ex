defmodule EntitySports.Model.MatchLiveScore do
  @moduledoc """
  Match LiveScore model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:runs, :integer)
    field(:overs, :float)
    field(:wickets, :integer)
    field(:target, :integer)
    field(:runrate, :float)
    field(:required_runrate, :float)
  end

  @fields [
    :runs,
    :overs,
    :wickets,
    :target,
    :runrate,
    :required_runrate
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
