defmodule KitchenCalculator do
  @moduledoc """
  Kitchen Calculator Module.
  """

  @type unit :: :cup | :fluid_ounce | :teaspoon | :tablespoon | :milliliter

  @spec get_volume({unit(), number()}) :: number()
  def get_volume({_unit, amount}), do: amount

  @spec to_milliliter({unit(), number()}) :: {unit(), number()}
  def to_milliliter({:cup, amount}), do: {:milliliter, 240 * amount}

  def to_milliliter({:fluid_ounce, amount}), do: {:milliliter, 30 * amount}

  def to_milliliter({:teaspoon, amount}), do: {:milliliter, 5 * amount}

  def to_milliliter({:tablespoon, amount}), do: {:milliliter, 15 * amount}

  def to_milliliter({:milliliter, amount}), do: {:milliliter, amount}

  @spec from_milliliter({unit(), number()}, unit()) :: {unit(), number()}
  def from_milliliter({:milliliter, amount}, :cup = unit), do: {unit, amount / 240}

  def from_milliliter({:milliliter, amount}, :fluid_ounce = unit), do: {unit, amount / 30}

  def from_milliliter({:milliliter, amount}, :teaspoon = unit), do: {unit, amount / 5}

  def from_milliliter({:milliliter, amount}, :tablespoon = unit), do: {unit, amount / 15}

  def from_milliliter({:milliliter, amount}, :milliliter = unit), do: {unit, amount}

  @spec convert({unit(), number()}, unit()) :: {unit(), number()}
  def convert({:milliliter, amount}, unit), do: from_milliliter({:milliliter, amount}, unit)

  def convert({unit, amount}, :milliliter), do: to_milliliter({unit, amount})

  def convert({given_unit, amount}, needed_unit) do
    {_unit, milliliters_amount} = to_milliliter({given_unit, amount})

    from_milliliter({:milliliter, milliliters_amount}, needed_unit)
  end
end
