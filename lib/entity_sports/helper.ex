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

  @doc """
  Helper for Appending Pagination Data
  """

  # def append_pagination({:ok, items}, total_items, total_pages), do: %{items: items, total_items: total_items, total_pages: total_pages}
  # def append_pagination(err, _total_items, _total_pages), do: err

  def maybe_add_pagination({:ok, _items} = res, nil, nil), do: res

  def maybe_add_pagination({:ok, _items} = res, total_pages, total_items),
    do: res |> Tuple.append(total_pages) |> Tuple.append(total_items)

  def maybe_add_pagination(err, _total_items, _total_pages), do: err

  def to_integer(value) when is_binary(value), do: String.to_integer(value)
  def to_integer(value), do: value
end
