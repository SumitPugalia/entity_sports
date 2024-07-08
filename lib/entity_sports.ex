defmodule EntitySports do
  @moduledoc """
  EntitySports API Interface
  """

  alias EntitySports.Model.Responses
  require Logger

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}
  @type match_status :: :scheduled | :completed | :live | :abandoned | :canceled | :no_result
  @type competition_status :: :fixture | :result | :live

  @doc """
  Provides information of all avaialable cricket seasons you have access.
  A season is named as complete year ie: 2016 for all tournaments that happens
  between march to october of the correspoding year, or name cross year
  ie: 2016-17 for matches happens between November-February or vice versa.
  """
  @callback seasons() :: {:ok, [Responses.Seasons.t()]} | error

  @doc """
  This will list all available competitions those you are subscribed.
  It will list 10 competitions data per request.
  If there is more than 10 competitions, you will get extra value under response node.
  You can use the page parameter to jump to a specific page if exists.
  """
  @callback competitions(status :: competition_status(), page :: integer(), size :: integer()) ::
              {:ok, [Responses.Competitions.t()], total_pages :: integer(),
               total_items :: integer()}
              | error

  @doc """
  Matches List API provide access to all of our matches.
  """
  @callback matches(
              status :: match_status(),
              start_date :: String.t(),
              end_date :: String.t(),
              page :: integer(),
              size :: integer()
            ) ::
              {:ok, [Responses.Match.t()], total_pages :: integer(), total_items :: integer()}
              | error

  @doc """
  Match Info API provide general match information.
  """
  @callback match(match_id :: integer()) :: {:ok, Responses.Match.t()} | error

  @doc """
  Match Fantasy Points API provide player fantasy points value based on match performance.
  """
  @callback match_fantasy(match_id :: integer()) :: {:ok, Responses.MatchFantasy.t()} | error

  @doc """
  Fantasy Match Roaster API provides information of player roaster for 2 teams of a match i.e. part of respective competition.
  When using this API match id(mid) needs to be passed for desired competition match squad.
  Purpose of this API is to provide managed Cricket fantasy credit and player role.
  Cricket Fantasy application must use this API for roaster of the both teams.

  Player credit and playing role won't change once pre_squad: "true".
  """
  @callback match_fantasy_squad(competition_id :: integer(), match_id :: integer()) ::
              {:ok, Responses.MatchFantasySquad.t()} | error

  @doc """
  Player Profile API provides details of player info.
  """
  @callback player_statstic(player_id :: integer()) :: {:ok, Responses.PlayerStats.t()} | error

  @doc """
  Match Live API provides live details of match.
  """
  @callback match_live(match_id :: integer()) :: {:ok, Responses.MatchLive.t()} | error
end
