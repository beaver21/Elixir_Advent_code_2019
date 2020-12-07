defmodule Day3Test do
  use ExUnit.Case
  import Day3

  @slope %{x: 3, y: 1}
  @slope2 %{x: 1, y: 2}
  @lines  lines = [
    "..##..#.#",
    "..#.###.#",
    "####.#..#",
    "..#.##.#.",
    "#.#.#...#"
  ]

  @lines2 lines2 = [
    "..##..#.#",
    "..#.###.#",
    "####.#..#",
    "..#.##.#.",
    "#.#.#...#",
    ".##..#..#",
    "###...#..",
    ".##....##",
    "...##...#",
    "##..##.##",
  ]

  test "repeat horizontal line" do
    expected = [
      "..##..#.#",
      "####.#..#",
      "#.#.#...#"
    ]

    assert Day3.remove_unecessary_row(@lines, %{y: 2}) == expected
  end

  test "read infinite row" do
    line = "..##..#.#"

    assert read_infinite_row(line, 16) == "."
    assert read_infinite_row(line, 21) == "#"
  end

  test "count trees encounter" do
    assert count_trees_encounter(@lines, @slope) == 0
  end

  test "count trees encounter skip row" do
    assert count_trees_encounter(@lines2, @slope2) == 3
  end

  test "input" do
    assert Day3.input() == Day3.input_marco()
  end


end
