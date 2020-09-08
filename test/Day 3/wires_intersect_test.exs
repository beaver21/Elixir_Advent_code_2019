defmodule WiresIntersectTest do
  use ExUnit.Case

  import WiresIntersect

  @tag :wire
  test "split direction" do
    result = getDirective("R78")

    assert result.direction == "R"
    assert result.distance == 78
  end

  @tag :wire
  test "get all possibility for directive" do
    directive = "U3"
    expected = [ [1,0], [2,0], [3,0] ]

    assert expected == getPathForDirective(directive, 0, 0)
  end

  @tag :wire
  test "calculate multiple path" do
    directives = ["U2", "R2"]
    expected = [ [1,0], [2,0], [2,1], [2,2] ]

    assert expected == calculateAllPath(directives)
  end

  @tag :wire
  test "negative direction" do
    directives = ["U1", "L1", "U1", "R4"]
    expected = [ [1,0], [1,-1], [2,-1], [2,0], [2,1], [2,2], [2,3] ]

    assert expected == calculateAllPath(directives)
  end

  @tag :wire
  test "get all intersect" do
    directives1 = ["U2", "R4"]
    directives2 = ["U1", "L1", "U1", "R4"]
    expected = [ [1,0],[2,0], [2,1], [2,2], [2,3] ]

    assert expected == getAllIntersect(directives1, directives2)
  end

  @tag :wire
  test "sum all intersect" do
    directives1 = ["U2", "R4"]
    directives2 = ["U1", "L1", "U1", "R4"]
    expected = 1

    assert expected == getCloserIntersectDistance(directives1, directives2)
  end

  @tag :response
  test "responses" do
    directives1 = File.read!("test/Day 3/directives1.txt")
                 |> String.split(",")
    directives2 = File.read!("test/Day 3/directives2.txt")
    |> String.split(",")

    assert 768 == getCloserIntersectDistance(directives1, directives2)
  end

end
