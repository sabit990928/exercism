defmodule BirdCount do
  def today([]), do: nil

  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]

  def increment_day_count([_hd | tail] = list) do
    [1 + today(list) | tail]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([hd | _tail]) when hd == 0 do
    true
  end

  def has_day_without_birds?([_hd | tail]) do
    has_day_without_birds?(tail)
  end

  def total([]), do: 0

  def total([hd | tail]) do
    hd + total(tail)
  end

  def busy_days([]), do: 0

  def busy_days([hd | tail]) when hd >= 5 do
    1 + busy_days(tail)
  end

  def busy_days([_hd | tail]) do
    busy_days(tail)
  end
end
