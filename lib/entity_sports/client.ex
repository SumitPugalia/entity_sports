defmodule EntitySports.Client do
  @moduledoc """
  EntitySports API Interface Delegators
  """

  @behaviour EntitySports
  @client_module Application.compile_env(:entity_sports, :client_module)

  @impl true
  defdelegate seasons, to: @client_module

  @impl true
  defdelegate competitions(status, page, size), to: @client_module

  @impl true
  defdelegate matches(status, start_date, end_date, page, size),
    to: @client_module

  @impl true
  defdelegate match(match_id), to: @client_module

  @impl true
  defdelegate match_fantasy(match_id), to: @client_module

  @impl true
  defdelegate match_fantasy_squad(competition_id, match_id),
    to: @client_module

  @impl true
  defdelegate player_statstic(player_id), to: @client_module

  @impl true
  defdelegate match_live(match_id), to: @client_module
end
