defmodule FuelCalculatorTest do
  use ExUnit.Case
  import FuelCalculator

test "no round down needed" do
  assert calculateFuel([12]) == 2
end

test "round down needed"  do
  assert calculateFuel([14]) == 2
end

test "high number" do
  assert calculateFuel([100756]) == 33583
end

test "calculate for multiples modules" do
  assert calculateFuel([12 ,14, 100756]) == 33587
end

test "code answer" do
  assert getModulesFromFile("test/Day 1/modules.txt")
        |> calculateFuel() == 3246455
end

test "recursive for single module" do
  assert FuelCalculatorRecursively.calculateFuel(100756, 0) == 50346
end

test "recursive for mutliple modules" do
  assert FuelCalculatorRecursively.calculateFuelForModules([80, 80]) == 60
end

test "code 2 answer" do
  assert FuelCalculatorRecursively.getModulesFromFile("test/Day 1/modules.txt")
    |> FuelCalculatorRecursively.calculateFuelForModules() == 4866824
end

end
