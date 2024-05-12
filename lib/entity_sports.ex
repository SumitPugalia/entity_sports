defmodule EntitySports do
  @moduledoc """
  EntitySports API Interface
  """

  alias EntitySports.Model.Responses
  require Logger

  @type error :: {:error, Ecto.Changeset.t(), map()} | {:error, integer(), any()}

  @doc """
  Provides information of all avaialable cricket seasons you have access. 
  A season is named as complete year ie: 2016 for all tournaments that happens 
  between march to october of the correspoding year, or name cross year 
  ie: 2016-17 for matches happens between November-February or vice versa.
  """
  @callback seasons() :: {:ok, [Responses.Seasons.t()]} | error
  @callback competitions(status :: String.t(), page :: integer(), size :: integer()) ::
              {:ok, [Responses.Competitions.t()], total_pages :: integer(),
               total_items :: integer()}
              | error
end
