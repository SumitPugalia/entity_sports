defmodule EntitySports do
  @moduledoc """
  EntitySports API Interface
  """

  alias EntitySports.Model.Responses
  require Logger

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  @doc """
  Provides information of all avaialable cricket seasons you have access. 
  A season is named as complete year ie: 2016 for all tournaments that happens 
  between march to october of the correspoding year, or name cross year 
  ie: 2016-17 for matches happens between November-February or vice versa.
  """
  @callback seasons() :: {:ok, [Responses.Seasons.t()]} | error

  @callback competitions(status :: String.t(), page :: integer(), size :: integer()) ::
              {:ok, [Responses.Competitions.t()], total_pages :: integer(),
               total_items :: integer()}
              | error

  @callback matches(
              status :: String.t(),
              start_date :: String.t(),
              end_date :: String.t(),
              timezone :: String.t(),
              page :: integer(),
              size :: integer()
            ) ::
              {:ok, [Responses.Match.t()], total_pages :: integer(), total_items :: integer()}
              | error

  @callback match(match_id :: integer()) :: {:ok, Responses.Match.t()} | error

  @callback match_fantasy(match_id :: integer()) :: {:ok, Responses.MatchFantasy.t()} | error

  @callback match_fantasy_squad(competition_id :: integer(), match_id :: integer()) ::
              {:ok, Responses.MatchFantasySquad.t()} | error

  @callback player_statstic(player_id :: integer()) :: {:ok, Responses.PlayerStats.t()} | error

  @callback match_odds(match_id :: integer()) :: {:ok, Responses.MatchOdds.t()} | error

  @callback settle_match_odds(match_id :: integer()) ::
              {:ok, [Responses.SettleMatchOdds.t()], total_pages :: integer(),
               total_items :: integer()}
              | error

  @callback match_innings_commentary(match_id :: integer(), inning_number :: integer()) ::
              {:ok, Responses.MatchInningsCommentary.t()} | error
end
