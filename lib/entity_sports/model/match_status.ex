defmodule EntitySports.Model.MatchStatus do
  @moduledoc """
  MatchStatus model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:status, :integer)
    field(:game_state, :integer)
  end

  @fields [:status, :game_state]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
