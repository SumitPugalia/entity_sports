defmodule EntitySports.HTTPClient do
  @moduledoc """
  EntitySports API HTTP Client implementation
  """
  @behaviour EntitySports

  alias EntitySports.Constants
  alias EntitySports.Model.Responses
  alias EntitySports.Utils

  require Logger

  @base_url Application.compile_env(:entity_sports, :base_url)
  @url_prefix Application.compile_env(:entity_sports, :url_prefix)
  @fanatsy_url @base_url  <> @url_prefix
  @exchange_url @base_url <> "/exchange"
  @token Application.compile_env(:entity_sports, :token)

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  @impl true
  def seasons() do
    response = Utils.get(@fanatsy_url <> "/seasons" <> "?token=#{@token}")
    Utils.deserialize_response(response, &Responses.Seasons.render_many/1)
  end

  @impl true
  def competitions(status, page, size) do
    response =
      Utils.get(
        @fanatsy_url <>
          "/competitions" <> "?token=#{@token}&per_page=#{size}&paged=#{page}&status=#{status}"
      )

    response
    |> Utils.deserialize_response(&Responses.Competitions.render_many/1)
  end

  @impl true
  def matches(status, start_date, end_date, timezone, page, size) do
    date = "#{start_date}_#{end_date}"
    status = Constants.status(status)

    response =
      Utils.get(
        @fanatsy_url <>
          "/matches" <>
          "?token=#{@token}&status=#{status}&date=#{date}&timezone=#{timezone}&paged=#{page}&per_page=#{size}"
      )

    Utils.deserialize_response(response, &Responses.Match.render_many/1)
  end

  @impl true
  def match(match_id) do
    response =
      Utils.get(
        @fanatsy_url <>
          "/matches/#{match_id}/info" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.Match.render/1)
  end

  @impl true
  def match_fantasy(match_id) do
    response =
      Utils.get(
        @fanatsy_url <>
          "/matches/#{match_id}/newpoint2" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.MatchFantasy.render/1)
  end

  @impl true
  def match_fantasy_squad(competition_id, match_id) do
    response =
      Utils.get(
        @fanatsy_url <>
          "/competitions/#{competition_id}/squads/#{match_id}" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.MatchFantasySquad.render/1)
  end

  @impl true
  def player_statstic(player_id) do
    response =
      Utils.get(
        @fanatsy_url <>
          "/players/#{player_id}/stats" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.PlayerStats.render/1)
  end

  @impl true
  def match_odds(match_id) do
    response =
      Utils.get(
        @exchange_url <>
          "/matches/#{match_id}/odds" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.MatchOdds.render/1)
  end

  @impl true
  def settle_match_odds(match_id) do
    response =
      Utils.get(
        @exchange_url <>
          "/matches/#{match_id}/settleodds" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.SettleMatchOdds.render_many/1)
  end
end
