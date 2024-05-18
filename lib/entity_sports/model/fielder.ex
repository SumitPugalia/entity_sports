defmodule EntitySports.Model.Fielder do
  @moduledoc """
  Fielder model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # 	fielder id
    field(:fielder_id, :string)
    # 	fielder name
    field(:fielder_name, :string)
    # 	Number of catches taken by player in the innings
    field(:catches, :integer)
    # 	number of times fielder created stumping
    field(:stumping, :integer)
    # 	false if fielder is part of playing 11, true if fielder was fielding as substitute
    field(:is_substitute, :string)
  end

  @fields [
    :fielder_id,
    :fielder_name,
    :catches,
    :stumping,
    :is_substitute
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
