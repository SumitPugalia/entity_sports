defmodule EntitySports.Stub do
  @moduledoc """
  EntitySports API STUB
  """

  @behaviour EntitySports

  alias EntitySports.Model.Responses

  @competition %{
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
  }

  @teama %{
    team_id: 127_851,
    name: "Puneri Bappa",
    short_name: "PB",
    logo_url:
      "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-13T172828.792.png",
    scores_full: "129/6 (15 ov)",
    scores: "129/6",
    overs: "15"
  }

  @teamb %{
    team_id: 127_851,
    name: "Puneri Bappa",
    short_name: "PB",
    logo_url:
      "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-13T172828.792.png",
    scores_full: "129/6 (15 ov)",
    scores: "129/6",
    overs: "15"
  }

  @venue %{
    venue_id: "24",
    name: "Maharashtra Cricket Association Stadium",
    location: "Pune",
    country: "India",
    timezone: ""
  }

  @toss %{
    text: "Ratnagiri Jets elected to bowl",
    winner: 127_855,
    decision: 2
  }

  @player_points %{
    pid: "43610",
    name: "Kurtis Patterson",
    role: "bat",
    rating: "9",
    point: "21",
    starting11: "4",
    run: "1",
    four: "0",
    six: "0",
    sr: "0",
    fifty: "0",
    duck: "0",
    wkts: "0",
    maidenover: "0",
    er: "0",
    catch: "16",
    runoutstumping: "0",
    runoutthrower: "0",
    runoutcatcher: "0",
    directrunout: "0",
    stumping: "0",
    thirty: "0",
    bonus: "0",
    bonuscatch: "0",
    bonusbowedlbw: "0"
  }

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
           competition: @competition,
           teama: @teama,
           teamb: @teamb,
           date_start: "2023-06-24 08:30:00",
           date_end: "2023-06-24 18:30:00",
           timestamp_start: 1_687_595_400,
           timestamp_end: 1_687_631_400,
           date_start_ist: "2023-06-24 14:00:00",
           date_end_ist: "2023-06-25 00:00:00",
           venue: @venue,
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
           toss: @toss
         }
       ], 1, 10}

  @impl true
  def match(_match_id),
    do:
      {:ok,
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
         competition: @competition,
         teama: @teama,
         teamb: @teamb,
         date_start: "2023-06-24 08:30:00",
         date_end: "2023-06-24 18:30:00",
         timestamp_start: 1_687_595_400,
         timestamp_end: 1_687_631_400,
         date_start_ist: "2023-06-24 14:00:00",
         date_end_ist: "2023-06-25 00:00:00",
         venue: @venue,
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
         toss: @toss
       }}

  @impl true
  def match_fantasy(_match_id),
    do:
      {:ok,
       %Responses.MatchFantasy{
         raw_response: %{},
         match_data: %Responses.Matches{
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
           competition: @competition,
           teama: @teama,
           teamb: @teamb,
           date_start: "2023-06-24 08:30:00",
           date_end: "2023-06-24 18:30:00",
           timestamp_start: 1_687_595_400,
           timestamp_end: 1_687_631_400,
           date_start_ist: "2023-06-24 14:00:00",
           date_end_ist: "2023-06-25 00:00:00",
           venue: @venue,
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
           toss: @toss
         },
         points: %{
           teama: %{
             playing11: [@player_points],
             substitute: [@player_points]
           },
           teamb: %{
             playing11: [@player_points],
             substitute: [@player_points]
           }
         }
       }}

  @impl true
  def match_fantasy_squad(_competition_id, _match_id),
    do: {:ok, %Responses.MatchFantasySquad{
      raw_response: %{},
      squad_type: "per_team",
      squads: [
        %{
          team_id: "14203",
          title: "Sydney Sixers",
          team: %{
              tid: 14203,
              title: "Sydney Sixers",
              abbr: "SIX",
              alt_name: "Sydney Sixers",
              type: "club",
              thumb_url: "https://images.entitysport.com/assets/uploads//2022/12/Sydney-Sixers.png",
              logo_url: "https://images.entitysport.com/assets/uploads//2022/12/Sydney-Sixers.png",
              country: "au",
              sex: "male"
          },
          players: [
            %{
              pid: 93388,
              title: "Josh Philippe",
              short_name: "JR Philippe",
              first_name: "Josh Philippe",
              last_name: "",
              middle_name: "",
              birthdate: "1997-06-01",
              birthplace: "",
              country: "au",
              primary_team: [],
              logo_url: "",
              playing_role: "wk",
              batting_style: "Right Hand Bat",
              bowling_style: "",
              fielding_position: "",
              recent_match: 0,
              recent_appearance: 0,
              fantasy_player_rating: 10,
              alt_name: "",
              facebook_profile: "",
              twitter_profile: "",
              instagram_profile: "",
              debut_data: "",
              thumb_url: "",
              nationality: "Australia"
            }
          ],
          last_match_played: [
            %{
              player_id: "93453",
              title: "Jack Edwards"
            }
          ]
        }
      ]
    }}

  @impl true
  def player_statstic(_player_id),
    do: {:ok, %Responses.PlayerStats{
      raw_response: %{}
    }}
end
