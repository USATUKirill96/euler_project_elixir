defmodule Problem1 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.

  ## Examples

      iex> Problem1.execute(1000)
      233168
  """
  @spec execute(integer) :: integer
  def execute(number) when number >= 0 do
    execute(number - 1 , 0)
  end

  @spec execute(integer, integer) :: integer
  defp execute(0, counter) do
    # edge case when the program finishes
    counter
  end


  defp execute(number, counter) do
    cond do
      rem(number, 3) == 0 or rem(number, 5) == 0 -> execute(number - 1, counter + number )
      true -> execute(number - 1, counter)
    end
  end

end
