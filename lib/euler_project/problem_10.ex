defmodule Problem10 do
  @moduledoc """

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.

  ## Examples

    iex> Problem10.execute()
    142913828922
"""

  @maximum 2000000

  def execute() do
    # we use the Sieve of Eratosthenes algorithm to define prime numbers

    # generate mapping of x:x in range of the maximum number
    array = for c <- 0..@maximum, into: %{}, do: {c, c}
    prime_numbers = check_number_in_range(2, array)
    Enum.reduce(prime_numbers, 0, fn({_key, value}, acc) -> value + acc end) - 1
  end

  def check_number_in_range(number, array) do
    # stop iterating is the current number is greater than @maximum
    if number >= @maximum do
      array
    else
      check_number_is_not_null(number, array)
    end

  end

  def check_number_is_not_null(number, array) do
    # execute converting multiples to null if current number is prime

    if array[number] == 0 do
      check_number_in_range(number+1, array)
    else
      new_array = change_to_null(number, number*2, array)
      check_number_in_range(number+1, new_array)
    end
  end

  def change_to_null(_number, multiple, array) when multiple > @maximum, do: array

  def change_to_null(number, multiple, array) do
    # change all multiples of a number in range of @maximum to null

    new_array = Map.replace(array, multiple, 0)
    change_to_null(number, multiple+number, new_array)
  end
end
