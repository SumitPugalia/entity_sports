defmodule EntitySports.Model.Responses.MatchLive do
  @moduledoc """
  MatchLive response body model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Helper
  alias EntitySports.Model

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:raw_response, :map)
    # match id
    field(:mid, :integer)
    # numerical representation of match status. see match_statuss reference.
    field(:status, :integer)
    # match status name.
    field(:status_str, :string)
    # numerical representation of match game_state. game state is available for live match only.
    field(:game_state, :integer)
    # match game_state name.
    field(:game_state_str, :string)

    # a small note of current match state. It would be the winning margin if match completed, could be current required rate if match is on live, and would containg date if match is scheduled.
    field(:status_note, :string)
    field(:day_remaining_over, :string)
    field(:team_batting, :string)
    field(:team_bowling, :string)
    field(:live_inning_number, :integer)
    embeds_one(:live_score, Model.MatchLiveScore)
    embeds_many(:batsmen, Model.MatchLiveBatsmen)
    embeds_many(:bowlers, Model.MatchLiveBowler)
    embeds_many(:commentaries, Model.Commentary)
    # embeds_many(:live_inning, Model.LiveInning)
    # embeds_many(:teams, Model.Teams)
    # embeds_many(:players, Model.Players)
  end

  @fields [
    :raw_response,
    :mid,
    :status,
    :status_str,
    :game_state,
    :game_state_str,
    :status_note,
    :day_remaining_over,
    :team_batting,
    :team_bowling,
    :live_inning_number
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:live_score)
    |> cast_embed(:batsmen)
    |> cast_embed(:bowlers)
    |> cast_embed(:commentaries)
    |> cast_embed(:live_inning)
    |> apply_action(nil)
  end

  def render_many(response) do
    Helper.render_many(response["items"], &__MODULE__.render/1)

    response["items"]
    |> Helper.render_many(&__MODULE__.render/1)
    |> Helper.maybe_add_pagination(
      response["total_pages"],
      response["total_items"] |> Helper.to_integer()
    )
  end

  def render(response) do
    case response |> Helper.append_raw_response(response) |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
