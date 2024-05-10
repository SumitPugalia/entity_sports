defmodule EntitySports.Helper do
  def render_many(items, mod) do
    result =
      items
      |> Enum.reduce_while([], fn item, response ->
        case mod.(item) do
          {:ok, resp} -> {:cont, [resp | response]}
          {:error, changeset, response} -> {:halt, {:error, changeset, response}}
        end
      end)

    case result do
      {:error, _changeset, _response} = err -> err
      items -> {:ok, items}
    end
  end

  def append_raw_response(response, raw_response),
    do: Map.put(response, "raw_response", raw_response)
end
