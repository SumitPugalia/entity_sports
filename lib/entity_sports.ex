defmodule EntitySports do
  @moduledoc """
  EntitySports API client interface
  """

  alias EntitySports.Model.Responses
  require Logger

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  # callbacks
  @doc """
  Provides information of all avaialable cricket seasons you have access. 
  A season is named as complete year ie: 2016 for all tournaments that happens 
  between march to october of the correspoding year, or name cross year 
  ie: 2016-17 for matches happens between November-February or vice versa.
  """
  @callback seasons() :: {:ok, [Responses.Seasons.t()]} | error
end
