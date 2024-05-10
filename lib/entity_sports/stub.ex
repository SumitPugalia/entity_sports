defmodule EntitySports.Stub do
  @moduledoc """
  EntitySports API STUB
  """

  @behaviour EntitySports

  alias EntitySports.Model.Responses

  @impl true
  def seasons(),
    do:
      {:ok,
       [
         %Responses.Seasons{
           raw_response: %{},
           sid: "2014",
           name: "2014",
           competitions_url: "seasons/2015/competitions"
         }
       ]}
end
