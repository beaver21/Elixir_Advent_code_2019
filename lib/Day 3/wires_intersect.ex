defmodule WiresIntersect do

  def getCloserIntersectDistance(directives1, directives2) do
    intersects = getAllIntersect(directives1, directives2)
    intersectDistances = Enum.map(intersects, fn x -> abs(Enum.at(x,0)) + abs(Enum.at(x,1)) end)
      |> Enum.sort()

    Enum.at(intersectDistances, 0)
  end

  def getAllIntersect(directives1, directives2) do
    path1 = calculateAllPath(directives1)
    path2 = calculateAllPath(directives2)

    MapSet.intersection(MapSet.new(path1), MapSet.new(path2))
  end

  def getDirective(directive) do
    [direction | distance] = String.split(directive,"",trim: true)

    %{direction: direction, distance: String.to_integer(Enum.join(distance))}
  end

  def calculateAllPath(t, acc \\ [[0,0]])

  def calculateAllPath([directive | remainings], acc) do
    last_path = Enum.at(acc, Enum.count(acc) - 1)

    paths = getPathForDirective(directive, Enum.at(last_path, 0), Enum.at(last_path, 1))

    calculateAllPath(remainings, acc ++ paths)
  end

  def calculateAllPath([], acc), do: Enum.drop(acc, 1)

  @spec getPathForDirective(binary, any, any) :: [any]
  def getPathForDirective(directive, x, y) do
    directive = getDirective(directive)

    calculatePossibility(directive.direction, directive.distance, x, y)
  end

  def calculatePossibility("U", distance, x, y) do
    Enum.map(1..distance, fn d -> [x + d, y] end)
  end

  def calculatePossibility("D", distance, x, y) do
    Enum.map(1..distance, fn d -> [x - d, y] end)
  end

  def calculatePossibility("R", distance, x, y) do
    Enum.map(1..distance, fn d -> [x, y + d] end)
  end

  def calculatePossibility("L", distance, x, y) do
    Enum.map(1..distance, fn d -> [x, y - d] end)
  end

end
