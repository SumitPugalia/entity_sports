defmodule EntitySports.Model.Matchodd do
  @moduledoc """
  Matchodd model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_one(:teama, Model.Odd)
    embeds_one(:teamb, Model.Odd)
  end

  @fields []

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> cast_embed(:teama)
    |> cast_embed(:teamb)
  end
end
