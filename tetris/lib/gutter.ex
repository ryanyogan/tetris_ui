defmodule Tetris.Gutter do
  def merge(gutter, points) do
    points
    |> Enum.map(fn {x, y, c} -> {{x, y}, {x, y, c}} end)
    |> Enum.into(gutter)
  end

  def collides?(gutter, {x, y, _color}), do: collides?(gutter, {x, y})

  def collides?(gutter, {x, y}) do
    !!Map.get(gutter, {x, y}) || x < 1 || x > 10 || y > 20
  end

  def collides?(gutter, points) when is_list(points) do
    Enum.any?(points, &collides?(gutter, &1))
  end
end
