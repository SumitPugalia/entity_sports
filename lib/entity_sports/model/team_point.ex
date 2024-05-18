defmodule EntitySports.Model.TeamPoint do
  @moduledoc """
  TeamPoint model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    embeds_many(:playing11, Model.PlayerPoints)
    embeds_many(:substitute, Model.PlayerPoints)
  end

  @fields []
  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> cast_embed(:playing11)
    |> cast_embed(:substitute)
  end
end
