defmodule EntitySports.Client do
  @moduledoc """
  EntitySports API Interface Delegators
  """

  @behaviour EntitySports
  @client_module Application.compile_env(:entity_sports, :client_module)

  @impl true
  def seasons, do: @client_module.seasons()

  @impl true
  def competitions(status, page, size), do: @client_module.competitions(status, page, size)

  @impl true
  def matches(status, start_date, end_date, page, size),
    do: @client_module.matches(status, start_date, end_date, page, size)

  @impl true
  def match(match_id), do: @client_module.match(match_id)

  @impl true
  def match_fantasy(match_id), do: @client_module.match_fantasy(match_id)

  @impl true
  def match_fantasy_squad(competition_id, match_id),
    do: @client_module.match_fantasy_squad(competition_id, match_id)

  @impl true
  def player_statstic(player_id), do: @client_module.player_statstic(player_id)
end
