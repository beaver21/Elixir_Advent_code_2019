defmodule FuelCalculatorRecursively do

  def calculateFuelForModules(modules) do
    Enum.map(modules, fn x -> calculateFuel(x, 0) end)
    |> Enum.sum()
  end

  @spec calculateFuel(any, any) :: any
  def calculateFuel(mass, fuelTotal) when mass <= 8, do: fuelTotal

  def calculateFuel(mass, fuelTotal) do
    fuel = div(mass, 3) - 2

    calculateFuel(fuel, fuelTotal + fuel)
  end

  def getModulesFromFile(path)do
    File.read!(path)
    |> String.split("\r\n")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

end
