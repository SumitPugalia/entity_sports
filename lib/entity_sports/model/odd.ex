defmodule EntitySports.Model.Odd do
  @moduledoc """
  Odd model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive Jason.Encoder
  @primary_key false
  embedded_schema do
    # back
    field(:back, :string)
    # lay
    field(:lay, :string)
    # back volume
    field(:back_volume, :string)
    # lay volume
    field(:lay_volume, :string)
  end

  @fields [
    :back,
    :lay,
    :back_volume,
    :lay_volume
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
