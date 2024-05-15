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
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:team)
    |> cast_embed(:players)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
