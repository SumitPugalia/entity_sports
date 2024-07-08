defmodule EntitySports.Model.Commentary do
  @moduledoc """
  Match Batsmen model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:event, :string)
    field(:over, :integer)
    field(:runs, :integer)
    field(:score, :string)
    field(:commentary, :string)
    field(:over_end_verify, :boolean)
    embeds_many(:commentary_bats, Model.MatchLiveScore)
    embeds_many(:commentary_bowls, Model.MatchLiveScore)
  end

  @fields [
    :event,
    :over,
    :runs,
    :score,
    :commentary,
    :over_end_verify
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
    |> cast_embed(:commentary_bats)
    |> cast_embed(:commentary_bowls)
  end
end
