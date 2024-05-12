defmodule EntitySports.Stub do
  @moduledoc """
  EntitySports API STUB
  """

  @behaviour EntitySports

  alias EntitySports.Model.Responses

  @impl true
  def seasons(),
    do:
      {:ok,
       [
         %Responses.Seasons{
           raw_response: %{},
           sid: "2014",
           name: "2014",
           competitions_url: "seasons/2015/competitions"
         }
       ]}

  @impl true
  def competitions(_status, _page, _size),
    do:
      {:ok,
       [
         %Responses.Competitions{
           raw_response: %{},
           cid: 90534,
           title: "England tour of Bangladesh",
           abbr: "bangladesh-v-england-2016-17",
           category: "international",
           game_format: "mixed",
           status: "result",
           season: "2016/17",
           datestart: "2016-10-04",
           dateend: "2016-11-02",
           total_matches: "8",
           total_rounds: "2",
           total_teams: "4",
           country: "int"
         }
       ], 1, 10}

  @impl true
  def matches(_status, _start_date, _end_date, _timezone, _page, _size),
    do:
      {:ok,
       [
         %Responses.Matches{
           raw_response: %{},
           match_id: 63951,
           title: "Puneri Bappa vs Ratnagiri Jets",
           short_title: "PB vs RJ",
           subtitle: "Match 14",
           match_number: "14",
           format: 6,
           format_str: "T20",
           status: 2,
           status_str: "Completed",
           status_note: "Ratnagiri Jets won by 8 runs (VJD method)",
           verified: "true",
           pre_squad: "true",
           odds_available: "false",
           game_state: 0,
           game_state_str: "Default",
           domestic: "1",
           competition: %{
             cid: 127_740,
             title: "Maharashtra Premier League",
             abbr: "Maharashtra Premier League",
             type: "tournament",
             category: "domestic",
             match_format: "t20",
             season: "2023",
             status: "result",
             datestart: "2023-06-15",
             dateend: "2023-06-29",
             country: "in",
             total_matches: "19",
             total_rounds: "1",
             total_teams: "8"
           },
           teama: %{
             team_id: 127_851,
             name: "Puneri Bappa",
             short_name: "PB",
             logo_url:
               "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-13T172828.792.png",
             scores_full: "129/6 (15 ov)",
             scores: "129/6",
             overs: "15"
           },
           teamb: %{
             team_id: 127_855,
             name: "Ratnagiri Jets",
             short_name: "RJ",
             logo_url:
               "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-13T173123.286.png",
             scores_full: "70/3 (7.4 ov)",
             scores: "70/3",
             overs: "7.4"
           },
           date_start: "2023-06-24 08:30:00",
           date_end: "2023-06-24 18:30:00",
           timestamp_start: 1_687_595_400,
           timestamp_end: 1_687_631_400,
           date_start_ist: "2023-06-24 14:00:00",
           date_end_ist: "2023-06-25 00:00:00",
           venue: %{
             venue_id: "24",
             name: "Maharashtra Cricket Association Stadium",
             location: "Pune",
             country: "India",
             timezone: ""
           },
           umpires: "Sandeep chavan (India), Vineet Kulkarni (India), Rohan Ingavale (India, TV)",
           referee: "",
           equation: "",
           live: "",
           result: "RJ won by 8 runs (VJD method)",
           result_type: 2,
           win_margin: "8 runs (VJD method)",
           winning_team_id: 127_855,
           commentary: 1,
           wagon: 0,
           latest_inning_number: 2,
           presquad_time: "2023-06-21 10:26:29",
           verify_time: "2023-06-24 06:48:47",
           match_dls_affected: "true",
           toss: %{
             text: "Ratnagiri Jets elected to bowl",
             winner: 127_855,
             decision: 2
           }
         }
       ], 1, 10}
end
