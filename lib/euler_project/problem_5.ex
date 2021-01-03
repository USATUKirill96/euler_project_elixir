defmodule Problem5 do
  @moduledoc """

  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

  ## Examples

      iex> Problem5.least_common_divisor(30, 18)
      6

      iex> Problem5.least_common_multiple([126], 70)
      630

      iex> Problem5.execute()
      232792560

  ## Links
  for least_common_divisor/2 explanation you can search for Euclidean algorithm for LCD
  https://www.programming9.com/tutorials/competitive-programming/399-gcd-of-two-numbers-euclidean-algorithm

  for least_common_multiple/2 you can find information here
  https://www.larserikpersson.se/webcourse/x-introduction-to-discrete-mathematics/3-euclids-algorithm-for-the-least-common-divisor/

  """

  def execute() do
  least_common_multiple(Enum.to_list(1..20))
  end


  def least_common_multiple(array) do
    least_common_multiple(array, 1)
  end


  @spec least_common_multiple([integer], integer) :: integer
  def least_common_multiple([head|tail], multiplier) do
    # Math formula looks like lcm(a, b) = a * b / lcd(a, b)
    divisor = least_common_divisor(head, multiplier)
    new_multiplier = div(head * multiplier, divisor)
    least_common_multiple(tail, new_multiplier)
  end


  def least_common_multiple([], multiplier) do
    multiplier
  end


  @doc """
  example for 30 and 18:
  remainder(30, 18) = 12
  remainder(18, 12) = 6
  remainder(12, 6) = 0
  so the lcd for 30 and 18 is 6
  """
  @spec least_common_divisor(integer, integer) :: integer
  def least_common_divisor(first, second) do

    bigger = max(first, second)
    smaller = min(first, second)

    remainder = rem(bigger, smaller)

    if remainder == 0 do
      smaller
    else
      least_common_divisor(smaller, remainder)
    end

  end

end
