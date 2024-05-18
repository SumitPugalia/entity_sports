defmodule EntitySports.Model.DidNotBat do
  @moduledoc """
  DidNotBat model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # player id
    field(:player_id, :string)
    # player name
    field(:name, :string)
  end

  @fields [:player_id, :name]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
