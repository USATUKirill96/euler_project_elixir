defmodule Problem4 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  Find the largest palindrome made from the product of two 3-digit numbers.


  ## Examples

      iex> Problem4.execute()
      906609
  """
  require Integer
  require String

  @minimal_number 100
  @maximal_number 999


  @spec execute() :: integer
  def execute() do revise_range(@maximal_number, 0) end


  # Edge case when every number of the range in revised
  @spec revise_range(integer, integer) :: integer
  defp revise_range(number, maximum) when number < @minimal_number do maximum end


  #  get the biggest palindromic number of product (number * range[minimal_number: maximal_number])
  defp revise_range(number, maximum) do
    number_result = check_number(number, @maximal_number)
    case number_result do
      {true, product} -> revise_range(number-1, max(maximum, product))
      {false, nil} -> revise_range(number-1, maximum)
    end
  end


  #  check if product of two numbers is palindromic
  @spec check_number(integer, integer) :: {false, nil} | {true, integer}
  defp check_number(number, variable) do

    product = number * variable
    product_str = Integer.to_string(product)

    cond do
      variable < @minimal_number -> {false, nil}
      product_str == String.reverse(product_str) -> {true, product}
      true -> check_number(number, variable - 1)
    end

  end
end
