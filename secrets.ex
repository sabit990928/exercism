defmodule Secrets do
  @moduledoc """
  Software for an encryption device that works by performing transformations on data.
  """

  # Adder
  def secret_add(secret) do
    fn param -> param + secret end
  end

  # Subtractor
  def secret_subtract(secret) do
    fn param -> param - secret end
  end

  # Multiplier
  def secret_multiply(secret) do
    &(secret * &1)
  end

  # Divider
  def secret_divide(secret) do
    &div(&1, secret)
  end

  # "and"-er
  def secret_and(secret) do
    fn param -> Bitwise.&&&(secret, param) end
  end

  # "xor"-er
  def secret_xor(secret) do
    fn param -> Bitwise.^^^(secret, param) end
  end

  # Function combiner
  def secret_combine(secret_function1, secret_function2) do
    fn param -> param |> secret_function1.() |> secret_function2.() end
  end
end
