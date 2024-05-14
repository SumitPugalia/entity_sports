defmodule EntitySports.Model.Responses.MatchFantasy do
  @moduledoc """
  Matches response body model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Helper
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:raw_response, :map)
    embeds_one(:match_data, Model.Matches)
    embeds_one(:points, Model.Point)
  end

  @fields [
    :raw_response
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:competition)
    |> cast_embed(:match_data)
    |> cast_embed(:points)
    |> apply_action(nil)
  end

  def render_many(response) do
    Helper.render_many(response["items"], &__MODULE__.render/1)

    response["items"]
    |> Helper.render_many(&__MODULE__.render/1)
    |> Helper.maybe_add_pagination(
      response["total_pages"],
      response["total_items"] |> Helper.to_integer()
    )
  end

  def render(response) do
    case response |> Helper.append_raw_response(response) |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
