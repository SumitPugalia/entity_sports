defmodule EntitySports.Helper do
  @moduledoc """
  Helper Module
  """

  @doc """
  Helper for Render Many
  """
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

  @doc """
  Helper for Appending Raw Response
  """
  def append_raw_response(response, raw_response),
    do: Map.put(response, "raw_response", raw_response)
end
