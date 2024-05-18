defmodule EntitySports.Model.SessionOdd do
  @moduledoc """
  SessionOdd model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # team batting
    field(:team_batting, :string)
    # title
    field(:title, :string)
    # back condition
    field(:back_condition, :string)
    # back
    field(:back, :string)
    # lay condition
    field(:lay_condition, :string)
    # lay
    field(:lay, :string)
    # status
    field(:status, :string)
    # unique key for each session
    field(:question_id, :integer)
  end

  @fields [
    :team_batting,
    :title,
    :back_condition,
    :back,
    :lay_condition,
    :lay,
    :status,
    :question_id
  ]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> apply_action(nil)
  end

  def render(response) do
    case response |> __MODULE__.changeset() do
      {:ok, model} -> {:ok, model}
      {:error, changeset} -> {:error, changeset, response}
    end
  end
end
