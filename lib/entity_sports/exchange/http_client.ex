defmodule EntitySports.Exchange.HTTPClient do
  @moduledoc """
  EntitySports API HTTP Client implementation
  """
  @behaviour EntitySportsExchange

  alias EntitySports.Constants
  alias EntitySports.Model.Responses
  alias EntitySports.Utils

  require Logger

  @base_url Application.compile_env(:entity_sports, :base_url)
  @exchange_url @base_url <> "/exchange"
  @token Application.compile_env(:entity_sports, :exchange_token)

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  @impl true
  def e_match_odds(match_id) do
    response =
      Utils.get(
        @exchange_url <>
          "/matches/#{match_id}/odds" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.MatchOdds.render/1)
  end

  @impl true
  def e_settle_match_odds(match_id) do
    response =
      Utils.get(
        @exchange_url <>
          "/matches/#{match_id}/settleodds" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.SettleMatchOdds.render_many/1)
  end

  @impl true
  def e_match_innings_commentary(match_id, inning_number) do
    response =
      Utils.get(
        @exchange_url <>
          "/matches/#{match_id}/innings/#{inning_number}/commentary" <>
          "?token=#{@token}"
      )

    Utils.deserialize_response(response, &Responses.MatchInningsCommentary.render/1)
  end

  @impl true
  def e_matches(status, start_date, end_date, page, size) do
    date = "#{start_date}_#{end_date}"
    status = Constants.status(status)

    response =
      Utils.get(
        @exchange_url <>
          "/matches" <>
          "?token=#{@token}&status=#{status}&date=#{date}&paged=#{page}&per_page=#{size}"
      )

    Utils.deserialize_response(response, &Responses.Match.render_many/1)
  end
end
