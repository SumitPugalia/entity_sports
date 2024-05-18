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

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:status, :game_state])
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
