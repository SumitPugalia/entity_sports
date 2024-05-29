defmodule EntitySports.Exchange.Client do
  @moduledoc """
  EntitySportsExchange API Interface Delegators
  """

  @behaviour EntitySportsExchange
  @client_module Application.compile_env(:entity_sports, :exchange_client_module)

  @impl true
  defdelegate e_match_odds(match_id), to: @client_module

  @impl true
  defdelegate e_settle_match_odds(match_id), to: @client_module

  @impl true
  defdelegate e_match_innings_commentary(match_id, inning_id), to: @client_module

  @impl true
  defdelegate e_matches(status, start_date, end_date, page, size), to: @client_module
end
