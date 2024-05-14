defmodule EntitySports.Model.PlayerPoints do
  @moduledoc """
  Points model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false

  embedded_schema do
    # player id
    field(:pid, :string)
    # player name
    field(:name, :string)
    # player match playing role
    field(:role, :string)
    # player salary credits
    field(:rating, :string)
    # player fantasy points based on match performance
    field(:point, :string)
    # player fantasy points for part of starting11
    field(:starting11, :string)
    # player fantasy points for runs scorecard
    field(:run, :string)
    # player fantasy points for number of 4s
    field(:four, :string)
    # player fantasy points for number of 6s
    field(:six, :string)
    # player fantasy points for strike rate
    field(:sr, :string)
    # player fantasy points for 50 runs scored
    field(:fifty, :string)
    # player fantasy points for 0 run scored
    field(:duck, :string)
    # player fantasy points for wickets taken
    field(:wkts, :string)
    # player fantasy for maiden over
    field(:maidenover, :string)
    # player fantasy points for economy rate
    field(:er, :string)
    # player fantasy points for catches taken
    field(:catch, :string)
    # player fantasy points runouts and stumping
    field(:runoutstumping, :string)
    # player fantasy points runouts and thrower
    field(:runoutthrower, :string)
    # player fantasy points runouts and catcher
    field(:runoutcatcher, :string)
    # player fantasy points direct run out
    field(:directrunout, :string)
    # player fantasy points stumping
    field(:stumping, :string)
    # player fantasy points thirty
    field(:thirty, :string)
    # player fantasy points bonus
    field(:bonus, :string)
    # player fantasy points bonus catch
    field(:bonuscatch, :string)
    # player fantasy points bonus bowed lbw
    field(:bonusbowedlbw, :string)
  end

  @fields [
    :pid,
    :name,
    :role,
    :rating,
    :point,
    :starting11,
    :run,
    :four,
    :six,
    :sr,
    :fifty,
    :duck,
    :wkts,
    :maidenover,
    :er,
    :catch,
    :runoutstumping,
    :runoutthrower,
    :runoutcatcher,
    :directrunout,
    :stumping,
    :thirty,
    :bonus,
    :bonuscatch,
    :bonusbowedlbw
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
