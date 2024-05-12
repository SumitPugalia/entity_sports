defmodule EntitySports.HTTPClient do
  @moduledoc """
  EntitySports API HTTP Client implementation
  """
  @behaviour EntitySports

  alias EntitySports.Helper
  alias EntitySports.Model.Responses
  alias EntitySports.Utils

  require Logger

  @base_url Application.compile_env(:entity_sports, :base_url)
  @token Application.compile_env(:entity_sports, :token)

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  @impl true
  def seasons() do
    response = Utils.get(@base_url <> "seasons" <> "?token=#{@token}")
    Utils.deserialize_response(response, &Responses.Seasons.render_many/1)
  end

  @impl true
  def competitions(status, page, size) do
    response =
      Utils.get(
        @base_url <>
          "competitions" <> "?token=#{@token}&per_page=#{size}&paged=#{page}&status=#{status}"
      )

    response
    |> Utils.deserialize_response(&Responses.Competitions.render_many/1)
  end
end
