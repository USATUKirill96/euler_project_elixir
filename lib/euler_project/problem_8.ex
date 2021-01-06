defmodule Problem8 do
    @moduledoc """
  The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
  Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?

   ## Examples

      iex> Problem8.execute()
      23514624000

  """

  @chunk_size 13
  @base "73167176531330624919225119674426574742355349194934\
96983520312774506326239578318016984801869478851843\
85861560789112949495459501737958331952853208805511\
12540698747158523863050715693290963295227443043557\
66896648950445244523161731856403098711121722383113\
62229893423380308135336276614282806444486645238749\
30358907296290491560440772390713810515859307960866\
70172427121883998797908792274921901699720888093776\
65727333001053367881220235421809751254540594752243\
52584907711670556013604839586446706324415722155397\
53697817977846174064955149290862569321978468622482\
83972241375657056057490261407972968652414535100474\
82166370484403199890008895243450658541227588666881\
16427171479924442928230863465674813919123162824586\
17866458359124566529476545682848912883142607690042\
24219022671055626321111109370544217506941658960408\
07198403850962455444362981230987879927244284909188\
84580156166097919133875499200524063689912560717606\
05886116467109405077541002256983155200055935729725\
71636269561882670428252483600823257530420752963450"


  @spec execute :: integer
  def execute() do
    get_range()  # get the list of all possible "left" borders
    |> Enum.map(fn(cursor) -> cut(cursor) end)  # cut the @base string to chunks
    |> Enum.map(fn(str) -> multiple(str) end)  # get the product of numbers in chunks
    |> Enum.max()  # return the largest value
  end


  @spec get_range :: list(integer)
  defp get_range() do
    # generate the list of "left" cursor position for creating chunks
    right_border = String.length(@base) - @chunk_size
    Enum.to_list(0..right_border)
  end


  @spec multiple(String.t) :: integer
  defp multiple(string) do
    string
    |> String.codepoints  # split the string by chars
    |> Enum.map(fn(str) -> String.to_integer(str) end)  # convert every char to integer
    |> Enum.reduce(fn(x, acc) -> x * acc end)  # calculate the product of all number in string
  end


  @spec cut(integer) :: String.t
  defp cut(cursor) do
    # cut the base string into chunk, using @chunk_size
    String.slice(@base, cursor, @chunk_size)
  end
end
