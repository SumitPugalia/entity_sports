defmodule EntitySports.Model.Competition do
  @moduledoc """
  Competition model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:cid, :integer)
    field(:title, :string)
    field(:abbr, :string)
    field(:type, :string)
    field(:category, :string)
    field(:match_format, :string)
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
    :cid,
    :title,
    :abbr,
    :type,
    :category,
    :match_format,
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
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
