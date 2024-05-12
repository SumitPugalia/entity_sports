defmodule EntitySports.Constants do
  ## Match Status
  def status(:scheduled), do: 1
  def status(:completed), do: 2
  def status(:live), do: 3
  def status(:abandoned), do: 4
  def status(:canceled), do: 4
  def status(:no_result), do: 4
end
