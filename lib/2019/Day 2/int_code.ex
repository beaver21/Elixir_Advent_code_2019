defmodule IntCode do

  @spec process(any, integer) :: any
  def process(int_codes, current_index \\ 0) do
    current_code = Enum.at(int_codes, current_index)

    if current_code == 99 do
        int_codes
    else
      result = calculate(current_code, int_codes, current_index)

      process(result, current_index + 4)
    end
  end

  @spec calculate(1 | 2, [any], integer) :: [any]
  def calculate(current_code, int_codes, current_index) do
    first_value = getValue(int_codes, current_index + 1)
    second_value = getValue(int_codes, current_index + 2)
    store_index = Enum.at(int_codes, current_index + 3)

    case current_code do
      1 -> List.replace_at(int_codes, store_index, first_value + second_value)
      2 -> List.replace_at(int_codes, store_index, first_value * second_value)
    end
  end

  defp getValue(int_codes, index) do
    Enum.at(int_codes, Enum.at(int_codes, index))
  end

  def part_two(int_codes, x \\ 0, y \\ 0) do
    memory = int_codes
    int_codes = List.replace_at(int_codes, 1, x)
    int_codes = List.replace_at(int_codes, 2, y)

    results = process(int_codes)

    if Enum.at(results, 0) == 19690720 do
      x * 100 + y
    else
      if y == 100 do
        part_two(memory, x + 1, 0)
      else
        part_two(memory, x, y + 1)
      end
    end
  end

end
