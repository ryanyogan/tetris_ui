defmodule Tetris do
  @moduledoc """
  Interface layer for Tetris game.
  """

  alias Tetris.{Brick, Gutter, Points}

  def prepare(brick) do
    brick
    |> Brick.prepare()
    |> Points.move_to_location(brick.location)
  end

  def try_move(brick, gutter, f) do
    new_brick = f.(brick)

    if Gutter.collides?(gutter, prepare(new_brick)) do
      brick
    else
      new_brick
    end
  end

  def try_left(brick, gutter), do: try_move(brick, gutter, &Brick.left/1)
  def try_right(brick, gutter), do: try_move(brick, gutter, &Brick.right/1)
  def try_spin_90(brick, gutter), do: try_move(brick, gutter, &Brick.spin_90/1)
end
