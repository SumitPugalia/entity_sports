defmodule EntitySports.Model.Batting do
  @moduledoc """
  Batting model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:match_id, :integer)
    field(:inning_id, :integer)
    field(:matches, :integer)
    field(:innings, :integer)
    field(:notout, :integer)
    field(:runs, :integer)
    field(:balls, :integer)
    field(:highest, :integer)
    field(:run100, :integer)
    field(:run50, :integer)
    field(:run4, :integer)
    field(:run6, :integer)
    field(:average, :string)
    field(:strike, :string)
    field(:catches, :integer)
    field(:stumpings, :integer)
    field(:fastest50balls, :integer)
    field(:fastest100balls, :integer)
  end

  @fields [
    :match_id,
    :inning_id,
    :matches,
    :innings,
    :notout,
    :runs,
    :balls,
    :highest,
    :run100,
    :run50,
    :run4,
    :run6,
    :average,
    :strike,
    :catches,
    :stumpings,
    :fastest50balls,
    :fastest100balls
  ]

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @fields)
  end
end
