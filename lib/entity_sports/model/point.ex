defmodule EntitySports.Model.Point do
  @moduledoc """
  Points model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_one(:teama, Model.TeamPoint)
    embeds_one(:teamb, Model.TeamPoint)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [])
    |> cast_embed(:teama)
    |> cast_embed(:teamb)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
