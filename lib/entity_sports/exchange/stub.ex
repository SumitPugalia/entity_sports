defmodule EntitySports.Exchange.Stub do
  @moduledoc """
  EntitySports API STUB
  """
  @behaviour EntitySportsExchange

  alias EntitySports.Model.Responses

  @impl true
  def e_match_odds(_match_id),
    do:
      {:ok,
       %Responses.MatchOdds{
         raw_response: %{},
         match_info: %EntitySports.Model.Match{
           match_id: 74760,
           match_number: nil,
           match_dls_affected: nil,
           title: "Royal Challengers Bengaluru vs Chennai Super Kings",
           short_title: "RCB vs CSK",
           subtitle: "Match 68",
           format: 6,
           format_str: "T20",
           status: 1,
           status_str: "Scheduled",
           status_note: nil,
           verified: nil,
           pre_squad: nil,
           odds_available: nil,
           game_state: 0,
           game_state_str: "Default",
           domestic: "1",
           competition: %EntitySports.Model.Competition{
             cid: 128_471,
             title: "Indian Premier League",
             abbr: "IPL 2024",
             type: "tournament",
             category: "domestic",
             match_format: "t20",
             status: "live",
             season: "2024",
             datestart: ~D[2024-03-22],
             dateend: ~D[2024-05-26],
             total_matches: 74,
             total_rounds: 1,
             total_teams: 10,
             country: "in"
           },
           teama: %EntitySports.Model.Team{
             team_id: 646,
             name: "Royal Challengers Bengaluru",
             short_name: "RCB",
             logo_url:
               "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-07T112223.720.png",
             scores_full: nil,
             scores: nil,
             overs: nil
           },
           teamb: %EntitySports.Model.Team{
             team_id: 610,
             name: "Chennai Super Kings",
             short_name: "CSK",
             logo_url: "https://images.entitysport.com/assets/uploads/2021/03/CSK-Logo.png",
             scores_full: nil,
             scores: nil,
             overs: nil
           },
           date_start: ~D[2024-05-18],
           date_end: ~D[2024-05-19],
           timestamp_start: 1_716_040_800,
           timestamp_end: 1_716_076_800,
           date_start_ist: "2024-05-18 19:30:00",
           date_end_ist: "2024-05-19 05:30:00",
           venue: %EntitySports.Model.Venue{
             venue_id: 20,
             name: "M.Chinnaswamy Stadium",
             location: "Bengaluru",
             timezone: nil
           },
           umpires:
             "Akshay Totre (India), KN Ananthapadmanabhan (India), Michael Gough (England, TV)",
           referee: "Daniel Manohar (India)",
           equation: nil,
           live: nil,
           result: nil,
           result_type: nil,
           win_margin: nil,
           winning_team_id: 0,
           commentary: 1,
           wagon: 1,
           latest_inning_number: 0,
           presquad_time: nil,
           verify_time: nil,
           oddstype: "betfair",
           toss: %EntitySports.Model.Toss{text: nil, winner: 0, decision: 0}
         },
         live_odds: %EntitySports.Model.LiveOdd{
           matchodds: %EntitySports.Model.Matchodd{
             teama: %EntitySports.Model.Odd{
               back: "1.9",
               lay: "1.91",
               back_volume: "1683.55",
               lay_volume: "1110.33"
             },
             teamb: %EntitySports.Model.Odd{
               back: "2.08",
               lay: "2.12",
               back_volume: "8610.99",
               lay_volume: "1844.28"
             }
           },
           tiedmatch: %EntitySports.Model.Tiedmatch{
             teama: %EntitySports.Model.Odd{
               back: "50",
               lay: "55",
               back_volume: "630.41",
               lay_volume: "153.99"
             },
             teamb: %EntitySports.Model.Odd{
               back: "1.01",
               lay: "1.02",
               back_volume: "113496.55",
               lay_volume: "30902.7"
             }
           },
           bookmaker: %EntitySports.Model.Bookmaker{
             teama: %EntitySports.Model.Odd{
               back: "1.88",
               lay: "1.92",
               back_volume: "500000.00",
               lay_volume: "500000.00"
             },
             teamb: %EntitySports.Model.Odd{
               back: "0.00",
               lay: "0.00",
               back_volume: "0.00",
               lay_volume: "0.00"
             }
           }
         },
         session_odds: [
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Sixes CSK adv",
             back_condition: "11",
             back: "100",
             lay_condition: "9",
             lay: "100",
             status: nil,
             question_id: 484_770
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Fours CSK adv",
             back_condition: "17",
             back: "100",
             lay_condition: "15",
             lay: "100",
             status: nil,
             question_id: 484_769
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total 2 runs CSK adv",
             back_condition: "10",
             back: "100",
             lay_condition: "8",
             lay: "100",
             status: nil,
             question_id: 484_768
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total 1 runs CSK adv",
             back_condition: "49",
             back: "100",
             lay_condition: "47",
             lay: "100",
             status: nil,
             question_id: 484_767
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Dot balls CSK adv",
             back_condition: "33",
             back: "100",
             lay_condition: "31",
             lay: "100",
             status: nil,
             question_id: 484_766
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Extras CSK adv",
             back_condition: "11",
             back: "100",
             lay_condition: "9",
             lay: "100",
             status: nil,
             question_id: 484_765
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Wkts CSK adv",
             back_condition: "7",
             back: "75",
             lay_condition: "7",
             lay: "125",
             status: nil,
             question_id: 484_764
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Sixes RCB adv",
             back_condition: "12",
             back: "100",
             lay_condition: "10",
             lay: "100",
             status: nil,
             question_id: 484_763
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Fours RCB adv",
             back_condition: "16",
             back: "100",
             lay_condition: "14",
             lay: "100",
             status: nil,
             question_id: 484_762
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total 2 runs RCB adv",
             back_condition: "10",
             back: "100",
             lay_condition: "8",
             lay: "100",
             status: nil,
             question_id: 484_761
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total 1 runs RCB adv",
             back_condition: "49",
             back: "100",
             lay_condition: "47",
             lay: "100",
             status: nil,
             question_id: 484_718
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Dot balls RCB adv",
             back_condition: "33",
             back: "100",
             lay_condition: "31",
             lay: "100",
             status: nil,
             question_id: 484_717
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Extras RCB adv",
             back_condition: "11",
             back: "100",
             lay_condition: "9",
             lay: "100",
             status: nil,
             question_id: 484_716
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "1st Inn 0 to 20 overs Total Wkts RCB adv",
             back_condition: "8",
             back: "100",
             lay_condition: "7",
             lay: "100",
             status: nil,
             question_id: 484_715
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Death Over Boundaries In 1st Inn(RCB vs CSK)adv",
             back_condition: "2",
             back: "80",
             lay_condition: "2",
             lay: "120",
             status: nil,
             question_id: 484_714
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Death Over Wickets In 1st Inn(RCB vs CSK)adv",
             back_condition: "2",
             back: "100",
             lay_condition: "1",
             lay: "100",
             status: nil,
             question_id: 484_713
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Death Over Runs 1st Inn(RCB vs CSK)adv",
             back_condition: "13",
             back: "100",
             lay_condition: "12",
             lay: "100",
             status: nil,
             question_id: 484_712
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most Wicket taken by a Bowler(RCB vs CSK)adv",
             back_condition: "4",
             back: "100",
             lay_condition: "3",
             lay: "100",
             status: nil,
             question_id: 484_711
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most Dotballs By a Bowler(RCB vs CSK)adv",
             back_condition: "14",
             back: "100",
             lay_condition: "12",
             lay: "100",
             status: nil,
             question_id: 484_710
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most Runs Given by a Bowler(RCB vs CSK)adv",
             back_condition: "52",
             back: "100",
             lay_condition: "49",
             lay: "100",
             status: nil,
             question_id: 484_709
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most Boundaries Given by a Bowler(RCB vs CSK)adv",
             back_condition: "8",
             back: "100",
             lay_condition: "6",
             lay: "100",
             status: nil,
             question_id: 484_708
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most 6s by an Individual Batsman(RCB vs CSK)adv",
             back_condition: "5",
             back: "80",
             lay_condition: "5",
             lay: "120",
             status: nil,
             question_id: 484_707
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most 4s by an Individual Batsman(RCB vs CSK)adv",
             back_condition: "9",
             back: "100",
             lay_condition: "7",
             lay: "100",
             status: nil,
             question_id: 484_706
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Most Balls Faced By a Batsman(RCB vs CSK)adv",
             back_condition: "50",
             back: "100",
             lay_condition: "46",
             lay: "100",
             status: nil,
             question_id: 484_705
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Top batsman runs in Match(RCB vs CSK)adv",
             back_condition: "75",
             back: "90",
             lay_condition: "75",
             lay: "110",
             status: nil,
             question_id: 484_704
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Highest Pship Boundaries(RCB vs CSK)adv",
             back_condition: "15",
             back: "100",
             lay_condition: "13",
             lay: "100",
             status: nil,
             question_id: 484_703
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Highest Pship Balls in Match(RCB vs CSK)adv",
             back_condition: "53",
             back: "100",
             lay_condition: "48",
             lay: "100",
             status: nil,
             question_id: 484_702
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Highest Pship Runs(RCB vs CSK)adv",
             back_condition: "93",
             back: "100",
             lay_condition: "88",
             lay: "100",
             status: nil,
             question_id: 484_701
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Highest Scoring over in Match(RCB vs CSK)adv",
             back_condition: "24",
             back: "100",
             lay_condition: "22",
             lay: "100",
             status: nil,
             question_id: 484_700
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Wickets In 1st Powerplay(RCB vs CSK)adv",
             back_condition: "2",
             back: "100",
             lay_condition: "1",
             lay: "100",
             status: nil,
             question_id: 484_699
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Dotballs in 1st Powerplay(RCB vs CSK)adv",
             back_condition: "16",
             back: "100",
             lay_condition: "14",
             lay: "100",
             status: nil,
             question_id: 484_698
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Boundaries in 1st Powerplay(RCB vs CSK)adv",
             back_condition: "10",
             back: "100",
             lay_condition: "8",
             lay: "100",
             status: nil,
             question_id: 484_697
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Total 1st over Runs in Match(RCB vs CSK)adv",
             back_condition: "17",
             back: "100",
             lay_condition: "15",
             lay: "100",
             status: nil,
             question_id: 484_696
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Total Match Impact overs(RCB vs CSK)adv",
             back_condition: "19",
             back: "100",
             lay_condition: "17",
             lay: "100",
             status: nil,
             question_id: 484_695
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Total Impact overs CSK(RCB vs CSK)adv",
             back_condition: "11",
             back: "100",
             lay_condition: "9",
             lay: "100",
             status: nil,
             question_id: 484_694
           },
           %EntitySports.Model.SessionOdd{
             team_batting: "0",
             title: "Total Impact overs RCB(RCB vs CSK)adv",
             back_condition: "11",
             back: "100",
             lay_condition: "9",
             lay: "100",
             status: nil,
             question_id: 484_693
           }
         ]
       }}

  @impl true
  def e_settle_match_odds(_match_id),
    do: {:ok, [%Responses.SettleMatchOdds{raw_response: %{}}], 1, 1}

  @impl true
  def e_match_innings_commentary(_match_id, _inning_number),
    do: {:ok, %Responses.MatchInningsCommentary{raw_response: %{}}}

  @impl true
  def e_matches(_status, _start_date, _end_date, _page, _size),
    do:
      {:ok,
       [
         %EntitySports.Model.Responses.Match{
           raw_response: %{
             "title" => "Royal Challengers Bengaluru vs Chennai Super Kings",
             "equation" => "",
             "game_state_str" => "Default",
             "win_margin" => "",
             "subtitle" => "Match 68",
             "status" => 1,
             "oddstype" => "betfair",
             "competition" => %{
               "abbr" => "IPL 2024",
               "category" => "domestic",
               "cid" => 128_471,
               "country" => "in",
               "dateend" => "2024-05-26",
               "datestart" => "2024-03-22",
               "match_format" => "t20",
               "season" => "2024",
               "status" => "live",
               "title" => "Indian Premier League",
               "total_matches" => "74",
               "total_rounds" => "1",
               "total_teams" => "10",
               "type" => "tournament"
             },
             "timestamp_start" => 1_716_040_800,
             "domestic" => "1",
             "referee" => "Daniel Manohar (India)",
             "latest_inning_number" => 0,
             "date_end" => "2024-05-19 00:00:00",
             "status_str" => "Scheduled",
             "match_id" => 74760,
             "result" => "",
             "umpires" =>
               "Akshay Totre (India), KN Ananthapadmanabhan (India), Michael Gough (England, TV)",
             "timestamp_end" => 1_716_076_800,
             "live" => "",
             "date_start" => "2024-05-18 14:00:00",
             "weather" => %{
               "clouds" => 40,
               "humidity" => 56,
               "temp" => 29.96,
               "visibility" => 4000,
               "weather" => "Drizzle",
               "weather_desc" => "light intensity drizzle",
               "wind_speed" => 3.44
             },
             "match_number" => "68",
             "short_title" => "RCB vs CSK",
             "status_note" => "",
             "date_start_ist" => "2024-05-18 19:30:00",
             "session_odds_available" => true,
             "toss" => %{"decision" => 0, "winner" => 0},
             "format_str" => "T20",
             "wagon" => 1,
             "commentary" => 1,
             "game_state" => 0,
             "pitch" => %{
               "batting_condition" => "High Scoring",
               "pace_bowling_condition" => "Pace & Bounce",
               "pitch_condition" => "Fast & Bounce",
               "spine_bowling_condition" => "Average"
             },
             "venue" => %{
               "country" => "India",
               "location" => "Bengaluru",
               "name" => "M.Chinnaswamy Stadium",
               "timezone" => "",
               "venue_id" => "20"
             },
             "result_type" => "",
             "teama" => %{
               "logo_url" =>
                 "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-07T112223.720.png",
               "name" => "Royal Challengers Bengaluru",
               "short_name" => "RCB",
               "team_id" => 646
             },
             "format" => 6,
             "date_end_ist" => "2024-05-19 05:30:00",
             "teamb" => %{
               "logo_url" => "https://images.entitysport.com/assets/uploads/2021/03/CSK-Logo.png",
               "name" => "Chennai Super Kings",
               "short_name" => "CSK",
               "team_id" => 610
             },
             "winning_team_id" => 0
           },
           match_id: 74760,
           match_number: nil,
           match_dls_affected: nil,
           title: "Royal Challengers Bengaluru vs Chennai Super Kings",
           short_title: "RCB vs CSK",
           subtitle: "Match 68",
           format: 6,
           format_str: "T20",
           status: 1,
           status_str: "Scheduled",
           status_note: nil,
           verified: nil,
           pre_squad: nil,
           odds_available: nil,
           game_state: 0,
           game_state_str: "Default",
           domestic: "1",
           competition: %EntitySports.Model.Competition{
             cid: 128_471,
             title: "Indian Premier League",
             abbr: "IPL 2024",
             type: "tournament",
             category: "domestic",
             match_format: "t20",
             status: "live",
             season: "2024",
             datestart: ~D[2024-03-22],
             dateend: ~D[2024-05-26],
             total_matches: 74,
             total_rounds: 1,
             total_teams: 10,
             country: "in"
           },
           teama: %EntitySports.Model.Team{
             team_id: 646,
             name: "Royal Challengers Bengaluru",
             short_name: "RCB",
             logo_url:
               "https://images.entitysport.com/assets/uploads/2023/06/Rectangle-3348-2023-06-07T112223.720.png",
             scores_full: nil,
             scores: nil,
             overs: nil
           },
           teamb: %EntitySports.Model.Team{
             team_id: 610,
             name: "Chennai Super Kings",
             short_name: "CSK",
             logo_url: "https://images.entitysport.com/assets/uploads/2021/03/CSK-Logo.png",
             scores_full: nil,
             scores: nil,
             overs: nil
           },
           date_start: ~D[2024-05-18],
           date_end: ~D[2024-05-19],
           timestamp_start: 1_716_040_800,
           timestamp_end: 1_716_076_800,
           date_start_ist: "2024-05-18 19:30:00",
           date_end_ist: "2024-05-19 05:30:00",
           venue: %EntitySports.Model.Venue{
             venue_id: 20,
             name: "M.Chinnaswamy Stadium",
             location: "Bengaluru",
             timezone: nil
           },
           umpires:
             "Akshay Totre (India), KN Ananthapadmanabhan (India), Michael Gough (England, TV)",
           referee: "Daniel Manohar (India)",
           equation: nil,
           live: nil,
           result: nil,
           result_type: nil,
           win_margin: nil,
           winning_team_id: 0,
           commentary: 1,
           wagon: 1,
           latest_inning_number: 0,
           presquad_time: nil,
           verify_time: nil,
           oddstype: "betfair",
           toss: %EntitySports.Model.Toss{text: nil, winner: 0, decision: 0}
         }
       ], 13, 13}
end
