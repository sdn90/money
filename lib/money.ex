defmodule Money do
  def new(num) do
    num_as_string = to_string(num)
    Decimal.new(num_as_string)
  end

  @doc """
  Takes a decimal and formats it as money

  ## Examples
    iex> Money.format("3.3324")
    "3.33"
  """
  def format(num) do
    num_as_string = to_string(num)
    parse_fraction(num_as_string)
  end

  @doc """
  Returns the fractional part of a number

  ## Examples
    iex> Money.parse_fraction(3.33)
    ".33"

  """
  def parse_fraction(num) do
    num_as_string = to_string(num)
    Integer.parse(num_as_string)
      |> elem(1)
      |> to_string
  end

  @doc """
  Returns a fraction with 2 decimal places
  """
  def precise(fraction) do
    split = fraction_split(parse_fraction(fraction))
    cond do
      fraction_length(fraction) > 2 ->
        IO.puts split
        Enum.slice(split, 0, 2)
          |> Enum.join
      fraction_length(fraction) < 2 ->
        "Fraction length is less than 2"
      fraction_length(fraction) == 2 ->
        "Fraction length is 2"
    end
  end

  def fraction_split(fraction) do
    String.split(fraction, "", trim: true)
    |> tl
  end

  def fraction_length(fraction) do
    fraction_split(fraction)
      |> length
  end
end

