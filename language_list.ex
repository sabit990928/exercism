defmodule LanguageList do
  def new, do: []

  def add(list, language) do
    [language | list]

    # `[language] ++ list` should make sense as well
  end

  def remove(list) do
    [_first | rest] = list

    rest

    # `Enum.drop(list, 1)` was suggested by copilot
    # While tl(list) can make sense as well
  end

  def first(list) do
    hd(list)
  end

  def count(list), do: length(list)

  def functional_list?(list) do
    # Enum.any?(list, &(&1 == "Elixir"))

    "Elixir" in list
  end
end
