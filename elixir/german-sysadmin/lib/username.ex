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
      only_lowercase(rest, sanitized ++ [ascii_number])
    else
      only_lowercase(rest, sanitized)
    end
  end

  def lowercase_letter?(ascii_number) do
    ascii_number >= 97 and ascii_number <= 122
  end
end
