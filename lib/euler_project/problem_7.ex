defmodule Problem7 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  What is the 10 001st prime number?

   ## Examples

      iex> Problem7.execute()
      104743

  """


  def execute() do
    generate()
  end


  @spec generate(integer, integer) :: integer
  def generate(cursor \\ 3, counter \\ 1) do
    unless has_dividers?(cursor) do
      if counter == 10000 do
        cursor
      else
        generate(cursor + 1, counter + 1)
      end
    else
      generate(cursor + 1, counter)
    end

  end

  @spec has_dividers?(integer()) :: false | true
  defp has_dividers?(number) do
    if rem(number, 2) == 0 do  # check division by 2, in the recursive function we're going to skip even numbers
      true
    else
      has_dividers?(number, 3)
    end
  end


  @spec has_dividers?(integer(), integer()) :: false | true
  defp has_dividers?(number, counter) do
    cond do
      number <= counter * 2 -> false # Edge case means there is no divider for the number except 1 and itself
      rem(number, counter) == 0 -> true
      true -> has_dividers?(number, counter + 2)
    end
  end
end
