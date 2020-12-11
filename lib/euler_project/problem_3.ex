defmodule Problem3 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?

  ## Examples

      iex> Problem3.execute(13195)
      29
  """
  require Integer

  @spec execute(integer()) :: integer()
  def execute(number) do
    get_biggest_divider(number)
  end


  @spec get_biggest_divider(integer()) :: integer()
  defp get_biggest_divider(number) do
     get_biggest_divider(number, div(number, 2))
    end


  @spec get_biggest_divider(integer(), integer()) :: integer()
  defp get_biggest_divider(_number, 1) do
    # edge case means there is no prime factors for the number except 1
    1
  end


  defp get_biggest_divider(number, divider) when number > 2 do
    if rem(number, divider) == 0 and not has_dividers?(divider) do
        divider
    else
      get_biggest_divider(number, divider - 1)
    end
  end


  @spec has_dividers?(integer()) :: false | true
  defp has_dividers?(number) do
    has_dividers?(number, 2)
  end


  @spec has_dividers?(integer(), integer()) :: false | true
  defp has_dividers?(number, counter) do
    cond do
      number <= counter * 2 -> false # Edge case means there is no divider for the number except 1 and itself
      rem(number, counter) == 0 -> true
      true -> has_dividers?(number, counter + 1)
    end
  end

end
