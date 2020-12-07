defmodule Day1Test do
  use ExUnit.Case
  import Day1

  test "find entries that sum" do
    input = [979, 1721, 366, 299, 675]

    assert find_input_that_sum(input) == {1721, 299}
  end

  test "multiply the results" do
    input = [979, 1721, 366, 299, 675]

    assert multiply_input_that_sum(input) == 514579
  end

end
