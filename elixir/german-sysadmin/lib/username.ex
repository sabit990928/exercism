defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    only_lowercase(username, [])
  end

  def only_lowercase([], []) do
    []
  end

  def only_lowercase([], sanitized) do
    sanitized
  end

  def only_lowercase([ascii_number | rest], sanitized) do
    if lowercase_letter?(ascii_number) do
      ascii_number = maybe_substitute_characters(ascii_number)
      only_lowercase(rest, sanitized ++ ([ascii_number] |> List.flatten()))
    else
      only_lowercase(rest, sanitized)
    end
  end

  def lowercase_letter?(ascii_number) do
    case ascii_number do
      ascii_number when ascii_number >= 97 and ascii_number <= 122 -> true
      # Underscore sign _
      95 -> true
      ascii_number when [ascii_number] == ~c'ä' -> true
      ascii_number when [ascii_number] == ~c'ö' -> true
      ascii_number when [ascii_number] == ~c'ü' -> true
      ascii_number when [ascii_number] == ~c'ß' -> true
      _ -> false
    end
  end

  # ß
  defp maybe_substitute_characters(223) do
    s_ascii_number = ?s

    [s_ascii_number, s_ascii_number]
  end

  # ö
  defp maybe_substitute_characters(246) do
    o_ascii_number = ?o
    e_ascii_number = ?e

    [o_ascii_number, e_ascii_number]
  end

  # ä
  defp maybe_substitute_characters(228), do: ~c"ae"
  # ü
  defp maybe_substitute_characters(252), do: ~c"ue"
  defp maybe_substitute_characters(ascii_number), do: ascii_number
end
