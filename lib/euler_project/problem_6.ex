defmodule Problem6 do
  @moduledoc """
  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

   ## Examples

      iex> Problem6.execute()
      25164150.0

  """

  def execute() do
    numbers = Enum.to_list(1..100)
    square_of_sum(numbers) - sum_of_squares(numbers, 0)
  end


  defp sum_of_squares([], current_summ) do
    current_summ
  end


  defp sum_of_squares([head|tail], current_summ) do
    sum_of_squares(tail, current_summ + :math.pow(head, 2))
  end


  defp square_of_sum(list) do
    sum_of_list = Enum.reduce(list, fn(x, acc) -> x + acc end)
    :math.pow(sum_of_list, 2)
  end

end
