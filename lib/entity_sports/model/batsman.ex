defmodule EntitySports.Model.Batsman do
  @moduledoc """
  Batsman model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # 	batsman name
    field(:name, :string)
    # 	batsman id
    field(:batsman_id, :string)
    # 	If batting then true,
    field(:batting, :string)
    # 	batting position
    field(:position, :string)
    # 	batsman role
    field(:role, :string)
    # 	role short description
    field(:role_str, :string)
    # 	batsman runs scored
    field(:runs, :string)
    # 	balls faced by batsman
    field(:balls_faced, :string)
    # 	four run scored by batsman
    field(:fours, :string)
    # 	four run scored by batsman
    field(:sixes, :string)
    # 	dot ball played by batsman
    field(:run0, :string)
    # 	batsman dismissal details
    field(:how_out, :string)
    # 	dismissal type
    field(:dismissal, :string)
    # 	strike rate of batsman
    field(:strike_rate, :string)
    # 	bowler id
    field(:bowler_id, :string)
    # 	first fielder id
    field(:first_fielder_id, :string)
    # 	seconde fielder id
    field(:second_fielder_id, :string)
    # 	third fielder id
    field(:third_fielder_id, :string)
  end

  @fields [
    :name,
    :batsman_id,
    :batting,
    :position,
    :role,
    :role_str,
    :runs,
    :balls_faced,
    :fours,
    :sixes,
    :run0,
    :how_out,
    :dismissal,
    :strike_rate,
    :bowler_id,
    :first_fielder_id,
    :second_fielder_id,
    :third_fielder_id
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
