defmodule EntitySports.Model.Responses.SettleMatchOdds do
  @moduledoc """
  SettleMatchOdds response body model
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias EntitySports.Helper

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    field(:raw_response, :map)
    field(:team_batting, :string)
    field(:title, :string)
    field(:back_condition, :string)
    field(:back, :string)
    field(:lay_condition, :string)
    field(:lay, :string)
    field(:status, :string)
    field(:settle, :string)
    field(:settle_type, :string)
    field(:settle_time, :string)
    field(:verified, :string)
    field(:verified_time, :string)
  end

  @fields [
    :raw_response,
    :team_batting,
    :title,
    :back_condition,
    :back,
    :lay_condition,
    :lay,
    :status,
    :settle,
    :settle_type,
    :settle_time,
    :verified,
    :verified_time
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> apply_action(nil)
  end

  def render_many(response) do
    Helper.render_many(response["items"], &__MODULE__.render/1)

    response["items"]
    |> Helper.render_many(&__MODULE__.render/1)
    |> Helper.maybe_add_pagination(
      response["total_pages"],
      response["total_items"] |> Helper.to_integer()
    )
  end

  def render(response) do
    case response |> Helper.append_raw_response(response) |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
