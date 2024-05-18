defmodule EntitySports.Model.TeamDetail do
  @moduledoc """
  TeamDetail model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:tid, :integer)
    field(:title, :string)
    field(:abbr, :string)
    field(:alt_name, :string)
    field(:type, :string)
    field(:thumb_url, :string)
    field(:logo_url, :string)
    field(:country, :string)
    field(:sex, :string)
  end

  @fields [
    :tid,
    :title,
    :abbr,
    :alt_name,
    :type,
    :thumb_url,
    :logo_url,
    :country,
    :sex
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
