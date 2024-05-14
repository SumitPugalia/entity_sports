defmodule EntitySports.Model.TeamPoint do
  @moduledoc """
  TeamPoint model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_many(:playing11, Model.PlayerPoints)
    embeds_many(:substitute, Model.PlayerPoints)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [])
    |> cast_embed(:playing11)
    |> cast_embed(:substitute)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
