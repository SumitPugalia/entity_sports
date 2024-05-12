defmodule EntitySports.Model.Responses.Competitions do
  @moduledoc """
  Competitions response body model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Helper

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:raw_response, :map)
    field(:cid, :integer)
    field(:title, :string)
    field(:abbr, :string)
    field(:category, :string)
    field(:game_format, :string)
    field(:status, :string)
    field(:season, :string)
    field(:datestart, :date)
    field(:dateend, :date)
    field(:total_matches, :integer)
    field(:total_rounds, :integer)
    field(:total_teams, :integer)
    field(:country, :string)
  end

  @fields [
    :raw_response,
    :cid,
    :title,
    :abbr,
    :category,
    :game_format,
    :status,
    :season,
    :datestart,
    :dateend,
    :total_matches,
    :total_rounds,
    :total_teams,
    :country
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> apply_action(nil)
  end

  def render_many(response) do
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
