defmodule EntitySports.Model.Header do
  use Ecto.Schema
  import Ecto.Changeset

  alias EntitySports.Model.Header

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:authorization, :string)
  end

  @fields [:authorization]

  def changeset(attrs) do
    changeset(%Header{}, attrs)
  end

  def changeset(header, attrs) do
    header
    |> cast(attrs, @fields)
  end
end
