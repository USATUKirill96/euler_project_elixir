defmodule Problem9 do
  @moduledoc """

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

## Examples

  iex> Problem9.execute()
  3.1875e7

"""

  @spec execute :: integer
  def execute(), do: try_first(1)


  @spec try_first(integer) :: integer
  def try_first(a) when a < 1000 do
    # register async tasks to double the function speed
    task1 = Task.async(Problem9, :try_second, [a, a])
    task2 = Task.async(Problem9, :try_second, [a, a+1])

    {status, result} = check_status([task1, task2])

    if status do
      result
    else
      try_first(a+1)
    end

  end

  def try_first(_a), do: 0


  @spec check_status([Task.t] | []) :: {boolean, integer}
  # checks if any of tasks succeed
  def check_status([]), do: {false, 0}

  def check_status([head|tail]) do
    {status, result} = Task.await(head)
    if status do
      {status, result}
    else
      check_status(tail)
    end
  end


  @spec try_second(integer, integer) :: {false, 0} | {true, float}
  # encapsulates the main business logic of problem
  def try_second(a, b) when b < 1000 do
    c = :math.pow(a, 2) + :math.pow(b, 2)
    sq_c = :math.sqrt(c)

    if Float.round(c) == c and a + b + sq_c == 1000 do
      {true, a*b*sq_c}
    else
      try_second(a, b+2)
    end
  end

  def try_second(_a, _b), do: {false, 0}

end
