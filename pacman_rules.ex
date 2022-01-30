defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end

  def lose?(power_pellet_active, touching_ghost) when touching_ghost do
    not power_pellet_active
  end

  def lose?(_power_pellet_active, _touching_ghost), do: false

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) when has_eaten_all_dots do
    not lose?(power_pellet_active, touching_ghost)
  end

  def win?(_has_eaten_all_dots, _power_pellet_active, _touching_ghost), do: false
end
