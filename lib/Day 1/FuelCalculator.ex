defmodule FuelCalculator do

  def calculateFuel(modules) do
      Enum.map(modules, &calculate/1)
      |> Enum.sum()
  end

  def getModulesFromFile(path)do
    File.read!(path)
    |> String.split("\r\n")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  @spec calculate(integer) :: integer
  defp calculate(mass) do
      div(mass, 3) - 2
  end

end
