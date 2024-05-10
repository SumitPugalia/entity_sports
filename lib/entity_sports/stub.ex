defmodule EntitySports.Stub do
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
