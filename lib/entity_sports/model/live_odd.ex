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

  @fields []

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> cast_embed(:matchodds)
    |> cast_embed(:tiedmatch)
    |> cast_embed(:bookmaker)
  end
end
