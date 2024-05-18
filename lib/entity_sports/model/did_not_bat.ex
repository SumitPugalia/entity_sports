defmodule EntitySports.Model.DidNotBat do
  @moduledoc """
  DidNotBat model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # player id
    field(:player_id, :string)
    # player name
    field(:name, :string)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:player_id, :name])
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
