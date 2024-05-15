defmodule EntitySports.Model.BowlingStats do
  @moduledoc """
  StatsFormat model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_one(:test, Model.Batting)
    embeds_one(:odi, Model.Batting)
    embeds_one(:t20i, Model.Batting)
    embeds_one(:t20, Model.Batting)
    embeds_one(:lista, Model.Batting)
    embeds_one(:firstclass, Model.Batting)
    embeds_one(:t10, Model.Batting)
  end

  @fields []

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:test)
    |> cast_embed(:odi)
    |> cast_embed(:t20i)
    |> cast_embed(:t20)
    |> cast_embed(:lista)
    |> cast_embed(:firstclass)
    |> cast_embed(:t10)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
