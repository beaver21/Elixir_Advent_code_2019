defmodule WiresIntersect do
  @directions %{"R" => :right, "L" => :left, "U" => :up, "D" => :down}

  def get_closer_intersect_distance(directives1, directives2) do
    intersects = get_all_intersect(directives1, directives2)
    
    Enum.map(intersects, fn x -> abs(Enum.at(x,0)) + abs(Enum.at(x,1)) end)
    |> Enum.sort()
    |> Enum.at(0)
  end

  def get_all_intersect(directives1, directives2) do
    path1 = calculate_all_path(directives1)
    path2 = calculate_all_path(directives2)

    MapSet.intersection(MapSet.new(path1), MapSet.new(path2))
  end

  def get_directive(directive) do
    [dir | distance] = String.split(directive,"",trim: true)

    {@directions[dir], String.to_integer(Enum.join(distance))}
  end

  def calculate_all_path(directives) do    
    Enum.reduce(directives, [[0,0]], fn directive, acc ->
      last_path = List.last(acc)

      acc ++ get_path_for_directive(directive, Enum.at(last_path, 0), Enum.at(last_path, 1))
    end) 
    |> Enum.drop(1)   
  end

  def get_path_for_directive(directive, x, y) do
    {direction, distance} = get_directive(directive)


    Enum.map(1..distance, fn d -> 
        case direction do
          :right -> [x, y + d]
          :left -> [x, y - d]
          :up -> [x + d, y]
          :down -> [x - d, y]
        end
      end)
  end

end
