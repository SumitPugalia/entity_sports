defmodule EntitySports.Model.Squad do
  @moduledoc """
  Squad model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:team_id, :string)
    field(:title, :string)
    embeds_one(:team, Model.TeamDetail)
    embeds_many(:players, Model.Player)
  end

  @fields [
    :team_id,
    :title
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> cast_embed(:team)
    |> cast_embed(:players)
  end
end
