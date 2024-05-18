defmodule EntitySports.Model.Team do
  @moduledoc """
  Team model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:team_id, :integer)
    field(:name, :string)
    field(:short_name, :string)
    field(:logo_url, :string)
    field(:scores_full, :string)
    field(:scores, :string)
    field(:overs, :string)
  end

  @fields [
    :team_id,
    :name,
    :short_name,
    :logo_url,
    :scores_full,
    :scores,
    :overs
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
