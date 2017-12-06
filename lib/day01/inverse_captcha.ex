defmodule Day01.InverseCaptcha do
  def run(file, fun) do
    file
    |> File.read!
    |> String.trim
    |> fun.()
  end

  def calc_captcha(digits) do
    digits
    |> to_integer_list
    |> append_head
    |> sum_digits(0)
  end

  defp to_integer_list(input) do
    input
    |> String.graphemes
    |> Enum.map(&String.to_integer/1)
  end

  defp append_head(digits, step \\ 1) do
    Enum.concat(digits, Enum.take(digits, step))
  end

  defp sum_digits(xs, sum, step \\ 1)
  defp sum_digits(xs, sum, step) when length(xs) < step, do: sum
  defp sum_digits([x | xs] = digits, sum, step) do
    case Enum.at(digits, step) == x do
      true ->
        sum_digits(xs, x + sum, step)
      false ->
        sum_digits(xs, sum, step)
    end
  end

  def calc_circular_captcha(digits) do
    step = div(String.length(digits), 2)

    digits
    |> to_integer_list
    |> append_head(step)
    |> sum_digits(0, step)
  end
end
