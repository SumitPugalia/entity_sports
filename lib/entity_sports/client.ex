defmodule EntitySports.Client do
  @moduledoc """
  EntitySports API Interface Delegators
  """

  @behaviour EntitySports
  @client_module Application.compile_env(:entity_sports, :client_module)

  @impl true
  defdelegate seasons, to: @client_module
end
