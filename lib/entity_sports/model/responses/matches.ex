defmodule EntitySports.Model.Responses.Match do
  @moduledoc """
  Match response body model
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
    # 	match id
    field(:match_id, :integer)
    field(:match_number, :string)
    field(:match_dls_affected, :boolean)
    # 	match name/title
    field(:title, :string)
    # 	contains both teams short name, ie Ind vs Aus
    field(:short_title, :string)

    # 	contains either the match format + number or important event name, ie: Final, 2nd ODI, 1st Quarterfinal.
    field(:subtitle, :string)
    # 	numerical representation of match format.
    field(:format, :integer)
    # match format name
    field(:format_str, :string)
    # 	numerical representation of match status. see match_statuss reference.
    field(:status, :integer)
    # 	match status name.
    field(:status_str, :string)

    # 	a small note of current match state. It would be the winning margin if match completed, could be current required rate if match is on live, and would containg date if match is scheduled.
    field(:status_note, :string)

    # 	"true" - Match Data is verified, "false" - Match Data is not verified. For fantasy solutions we suggest keep updating API until you receive verfied: true.
    field(:verified, :string)

    # "true" - Fantasy Match Roaster API has managed fantasy credit and player role, "false" - Fantasy Match Roaster API don't have managed fantasy credit and player role.
    field(:pre_squad, :string)
    # true = pre match odds available, false = pre match odds not available.
    field(:odds_available, :string)
    # numerical representation of match game_state. game state is available for live match only.
    field(:game_state, :integer)
    # match game_state name.
    field(:game_state_str, :string)
    # 	numerical representation of match category type
    field(:domestic, :string)
    # 	an array of parent competition details of the match, see competition object properties.
    embeds_one(:competition, Model.Competition)
    # 	Team A details, see teama match properties.
    embeds_one(:teama, Model.Team)
    # 	Team B details, see teamb match properties.
    embeds_one(:teamb, Model.Team)
    # 	match start date in GMT(UTC +0)
    field(:date_start, :date)
    # match end date in GMT(UTC +0)
    field(:date_end, :date)
    # 	match start timestamp in GMT(UTC +0)
    field(:timestamp_start, :integer)
    # match end timestamp in GMT(UTC +0)
    field(:timestamp_end, :integer)
    # match start date in IST (UTC+05:30)
    field(:date_start_ist, :string)
    # 	match enddate in IST (UTC+05:30)
    field(:date_end_ist, :string)
    # an array of venue details of the match, see venue object properties.
    embeds_one(:venue, Model.Venue)
    # umpires of the match.
    field(:umpires, :string)
    # referee of the match.
    field(:referee, :string)
    # 	match result condition.
    field(:equation, :string)
    # 	live match status note.
    field(:live, :string)
    # result of the match
    field(:result, :string)
    # 	numerical representation of result
    field(:result_type, :integer)
    # match win margin.
    field(:win_margin, :string)
    # 	winning team id
    field(:winning_team_id, :integer)
    # numerical representation of commentary available or not for match.
    field(:commentary, :integer)
    # numerical representation of wagon available or not for match.
    field(:wagon, :integer)
    # latest or active innings number.
    field(:latest_inning_number, :integer)
    # match presquad time
    field(:presquad_time, :string)
    # match veirfied time
    field(:verify_time, :string)

    field(:oddstype, :string)

    # an array of toss details of the match, see toss object properties.
    embeds_one(:toss, Model.Toss)
    # embeds_one(:weathe, Model.Weather)
    # embeds_one(:weathe, Model.Pitch)
  end

  @fields [
    :raw_response,
    :match_id,
    :title,
    :short_title,
    :subtitle,
    :format,
    :format_str,
    :status,
    :status_str,
    :status_note,
    :verified,
    :pre_squad,
    :odds_available,
    :game_state,
    :game_state_str,
    :domestic,
    :date_start,
    :date_end,
    :timestamp_start,
    :timestamp_end,
    :date_start_ist,
    :date_end_ist,
    :umpires,
    :referee,
    :equation,
    :live,
    :result,
    :result_type,
    :win_margin,
    :winning_team_id,
    :commentary,
    :wagon,
    :latest_inning_number,
    :presquad_time,
    :verify_time,
    :oddstype
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:competition)
    |> cast_embed(:teama)
    |> cast_embed(:teamb)
    |> cast_embed(:venue)
    |> cast_embed(:toss)
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
