defmodule EntitySportsExchange do
  @moduledoc """
  EntitySportsExchange API Interface
  """

  alias EntitySports.Model.Responses
  require Logger

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}
  @type match_status :: :scheduled | :completed | :live | :abandoned | :canceled | :no_result

  @callback e_match_odds(match_id :: integer()) :: {:ok, Responses.MatchOdds.t()} | error

  @callback e_settle_match_odds(match_id :: integer()) ::
              {:ok, [Responses.SettleMatchOdds.t()], total_pages :: integer(),
               total_items :: integer()}
              | error

  @callback e_match_innings_commentary(match_id :: integer(), inning_number :: integer()) ::
              {:ok, Responses.MatchInningsCommentary.t()} | error

  @callback e_matches(
              status :: match_status(),
              start_date :: String.t(),
              end_date :: String.t(),
              page :: integer(),
              size :: integer()
            ) ::
              {:ok, [Responses.Match.t()], total_pages :: integer(), total_items :: integer()}
              | error
end
