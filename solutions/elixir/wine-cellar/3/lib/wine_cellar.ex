defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cellar
    |> wines_of_color(color)
    |> maybe_use_filtering_by_option(opts[:year], &filter_by_year/2)
    |> maybe_use_filtering_by_option(opts[:country], &filter_by_country/2)
  end

  defp wines_of_color(cellar, wine_color), do: Keyword.get_values(cellar, wine_color)

  defp maybe_use_filtering_by_option(list, nil = _option, _filter_func), do: list

  defp maybe_use_filtering_by_option(list, option, filter_func) do
    filter_func.(list, option)
  end

  # The functions below do not need to be modified.
  # Let's imagine it's an external API, so you can't really change it.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
