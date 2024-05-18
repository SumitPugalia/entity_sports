defmodule EntitySports.Model.MatchInning do
  @moduledoc """
  MatchInning model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # 	inning number
    field(:number, :integer)
    # 	inning name
    field(:name, :string)
    # 	inning short name
    field(:short_name, :string)
    # 	numerical representation of inning status
    field(:status, :integer)
    # 	inning super over (true/false).
    field(:issuperover, :string)
    # 	numerical representation of result
    field(:result, :integer)
    # 	team id of batting team
    field(:batting_team_id, :integer)
    # 	team id of fielding team
    field(:fielding_team_id, :integer)
    # 	team score
    field(:scores, :string)
    # 	team full score
    field(:scores_full, :string)
    # 	an array of max overobject details. see max over Properties
    field(:max_over, :string)

    # 	an array of batsmen object details. see batsman Properties
    embeds_many(:batsmen, Model.Batsman)
    # 	an array of bowlers object details. see bowler Properties
    embeds_many(:bowlers, Model.Bowler)
    # 	an array of fielder object details. see fielder Properties
    embeds_many(:fielder, Model.Fielder)

    # embeds_many(:powerplay, Model.Powerplay) #	an array of powerplay object details. see powerplay Properties
    # 	an array of did not batobject details. see did not bat Properties
    embeds_many(:did_not_bat, Model.DidNotBat)
    # embeds_one(:review, Model.Review) #	an array of review object details. see review Properties
  end

  @fields [
    :number,
    :name,
    :short_name,
    :status,
    :issuperover,
    :result,
    :batting_team_id,
    :fielding_team_id,
    :scores,
    :scores_full,
    :max_over
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:batsmen)
    |> cast_embed(:bowlers)
    |> cast_embed(:fielder)
    # |> cast_embed(:powerplay)
    |> cast_embed(:did_not_bat)
    # |> cast_embed(:review)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
