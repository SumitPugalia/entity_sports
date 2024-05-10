defmodule EntitySports.Client do
  @moduledoc """
  EntitySports API HTTP client implementation
  """
  @behaviour EntitySports

  @client_module Application.compile_env(:entity_sports, :client_module)
  @doc """
  Provides information of all avaialable cricket seasons you have access. 
  A season is named as complete year ie: 2016 for all tournaments that happens 
  between march to october of the correspoding year, or name cross year 
  ie: 2016-17 for matches happens between November-February or vice versa.
  """

  @impl true
  def seasons(), do: @client_module.seasons()
end
