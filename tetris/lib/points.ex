defmodule Tetris.Points do
  def move_to_location(points, {x, y} = _location) do
    Enum.map(points, fn {dx, dy} ->
      {dx + x, dy + y}
    end)
  end

  @spec transpose(any) :: [any]
  def transpose(points) do
    Enum.map(points, fn {x, y} -> {y, x} end)
  end

  @spec mirror(any) :: [any]
  def mirror(points) do
    Enum.map(points, fn {x, y} -> {5 - x, y} end)
  end

  @spec mirror(any, boolean) :: any
  def mirror(points, false), do: points
  def mirror(points, true), do: mirror(points)

  @spec flip(any) :: [any]
  def flip(points) do
    Enum.map(points, fn {x, y} -> {x, 5 - y} end)
  end

  @spec rotate_90(any) :: [any]
  def rotate_90(points) do
    points
    |> transpose()
    |> mirror()
  end

  @spec rotate(any, non_neg_integer) :: any
  def rotate(points, 0), do: points

  def rotate(points, degrees) do
    rotate(
      rotate_90(points),
      degrees - 90
    )
  end

  def with_color(points, color) do
    Enum.map(points, fn point -> add_color(point, color) end)
  end

  defp add_color({_x, _y, _c} = point, _color), do: point
  defp add_color({x, y}, color), do: {x, y, color}

  @spec to_string(any) :: binary
  def to_string(points) do
    map =
      points
      |> Enum.map(fn key -> {key, "◼︎"} end)
      |> Map.new()

    for x <- 1..4, y <- 1..4 do
      Map.get(map, {y, x}, "◻︎")
    end
    |> Enum.chunk_every(4)
    |> Enum.map(&Enum.join/1)
    |> Enum.join("\n")
  end

  @spec print(any) :: any
  def print(brick) do
    IO.puts(__MODULE__.to_string(brick))
    brick
  end
end
