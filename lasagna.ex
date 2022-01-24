defmodule Lasagna do
  @moduledoc """
  Contains helpers to prepare proper Lasagna
  """

  @doc """
  Returns amount of average minutes in oven to prepare Lasagna.
  """
  def expected_minutes_in_oven(), do: 40

  @doc """
  Returns remaining minutes in oven depend on actual time in oven.
  """
  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end

  @doc """
  Returns lasagna preparation time depend on it's layers amount.
  """
  def preparation_time_in_minutes(layers_amount), do: 2 * layers_amount

  @doc """
  Returns sum of preparation time and minutes spent in oven.
  """
  def total_time_in_minutes(layers_amount, minutes_in_oven) do
    preparation_time_in_minutes(layers_amount) + minutes_in_oven
  end

  @doc """
  Returns notification when dish is ready to eat.
  """
  def alarm(), do: "Ding!"
end
