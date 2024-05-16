defmodule EntitySports.Model.LiveOdd do
  @moduledoc """
  LiveOdd model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_one(:matchodds, Model.Matchodd)
    embeds_one(:tiedmatch, Model.Tiedmatch)
    embeds_one(:bookmaker, Model.Bookmaker)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [])
    |> cast_embed(:matchodds)
    |> cast_embed(:tiedmatch)
    |> cast_embed(:bookmaker)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
