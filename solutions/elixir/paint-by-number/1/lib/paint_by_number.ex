defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    pow_range(color_count, 1)
  end

  defp pow_range(color_count, bit_size) do
    if 2 ** bit_size >= color_count do
      bit_size
    else
      pow_range(color_count, bit_size + 1)
    end
  end

  def empty_picture(), do: <<>>

  def test_picture() do
    # 2 is the ::size(2) and stands for the bit size out of 8
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bitsize = palette_bit_size(color_count)
    <<pixel_color_index::size(bitsize), picture::bitstring>>
  end

  def get_first_pixel(<<>> = _empty_picture, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    bitsize = palette_bit_size(color_count)

    <<first_color_index::size(bitsize), _rest::bitstring>> = picture

    first_color_index
  end

  def drop_first_pixel(<<>> = empty_picture, _color_count), do: empty_picture

  def drop_first_pixel(picture, color_count) do
    bitsize = palette_bit_size(color_count)
    <<_first_pixel::size(bitsize), rest::bitstring>> = picture

    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
