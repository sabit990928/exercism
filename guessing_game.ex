defmodule GuessingGame do
  @moduledoc """
  Guessing Game Module.
  """

  @doc """
  Compares a secret number to a guess.
  """
  @spec compare(integer(), integer | :no_guess) :: String.t()
  def compare(secret_number, guess \\ :no_guess)

  def compare(_secret_number, guess) when guess == :no_guess, do: "Make a guess"

  def compare(secret_number, guess) when secret_number == guess, do: "Correct"

  def compare(secret_number, guess)
      when secret_number - 1 == guess or secret_number + 1 == guess do
    "So close"
  end

  def compare(secret_number, guess) when secret_number > guess, do: "Too low"

  def compare(secret_number, guess) when secret_number < guess, do: "Too high"
end
