defmodule Day02.CorruptionChecksum do
  def run(file, fun) do
    file
    |> File.read!
    |> String.trim
    |> fun.()
  end

  def calc_spreadsheet_checksum(content) do
    content
    |> split_lines
    |> Stream.map(&calc_line_diff_value/1)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp split_lines(content) do
    content
    |> String.split("\n", trim: true)
  end

  defp calc_line_diff_value(line) do
    numbers =
      line
      |> split_numbers

    Enum.max(numbers) - Enum.min(numbers)
  end

  defp split_numbers(line) do
    line
    |> String.split("\t", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def calc_spreadsheet_checksum_evenly_divisible(content) do
    content
    |> split_lines
    |> Stream.map(&calc_evenly_divisible_value/1)
    |> Enum.reduce
  end

  defp calc_evenly_divisible_value(line) do
    numbers =
      line
      |> split_numbers
      |> Enum.sort(&(&1 >= &2))

    # for each x iterate across xs by using rem() to see if its evenly divisible and halt on the first match found
    # find_evenly_divisible_numbers([x | xs])
    # for y <- xs, rem(x, y) == 0, do: div(x, y)
  end
end
