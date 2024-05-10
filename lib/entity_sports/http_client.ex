defmodule EntitySports.HTTPClient do
  @moduledoc """
  EntitySports API HTTP client implementation
  """
  @behaviour EntitySports

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
end
