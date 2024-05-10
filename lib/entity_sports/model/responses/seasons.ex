defmodule EntitySports.Model.Responses.Seasons do
  @moduledoc """
  Seasons response body model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Helper

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:raw_response, :map)
    field(:sid, :string)
    field(:name, :string)
    field(:competitions_url, :string)
  end

  @fields [
    :raw_response,
    :sid,
    :name,
    :competitions_url
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> apply_action(nil)
  end

  def render_many(response) do
    Helper.render_many(response["items"], &__MODULE__.render/1)
  end

  def render(response) do
    case response |> Helper.append_raw_response(response) |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
