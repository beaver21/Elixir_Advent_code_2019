defmodule IntCodeTest do
  use ExUnit.Case

  import IntCode

  test "calculate when one code 1"  do
    assert [2,0,0,0,99] == process([1,0,0,0,99])
  end


  test "calculate when one code 2"  do
    assert [2,3,0,6,99] == process([2,3,0,3,99])
  end

  @tag :caca
  test "an other programm" do
    assert [2,4,4,5,99,9801] == process([2,4,4,5,99,0])
  end

  test "multiple programme" do
    int_codes = [1,1,1,4,99,5,6,0,99]

    assert [30,1,1,4,2,5,6,0,99] == process(int_codes)
  end

  test "answer" do
    path = "test/Day 2/intcodes.txt"

    int_codes =  File.read!(path)
    |> String.split(",")
    |> Enum.map(fn x -> String.to_integer(x) end)

    int_codes = List.replace_at(int_codes, 1, 12)
    int_codes = List.replace_at(int_codes, 2, 2)

    assert 5534943 == Enum.at(process(int_codes), 0)
  end

  test "answer part 2" do
    path = "test/Day 2/intcodes.txt"
    int_codes =  File.read!(path)
    |> String.split(",")
    |> Enum.map(fn x -> String.to_integer(x) end)

    assert 7603 == part_two(int_codes)
  end


end
