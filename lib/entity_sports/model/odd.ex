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
    field(:back, :string) # back
    field(:lay, :string) # lay
    field(:back_volume,	:string) # back volume
    field(:lay_volume, :string)	# lay volume
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
