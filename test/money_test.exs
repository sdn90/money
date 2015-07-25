defmodule MoneyTest do
  use ExUnit.Case

  test "creates a decimal" do
    assert Decimal.decimal?(Money.new("3.33"))
    assert Decimal.decimal?(Money.new(4.252))
    assert Decimal.decimal?(Money.new('4.25'))
  end

  test "only accepts fractions" do
    assert_raise ArgumentError, fn ->
      Money.fraction_length("33")
    end
  end

end
