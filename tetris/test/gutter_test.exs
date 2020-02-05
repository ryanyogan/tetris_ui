defmodule Tetris.GutterTest do
  use ExUnit.Case

  import Tetris.Gutter

  test "various collisions" do
    gutter = %{{1, 1} => {1, 1, :blue}}

    assert collides?(gutter, {1, 1})
    refute collides?(gutter, {1, 2})
    assert collides?(gutter, {1, 1, :blue})
    assert collides?(gutter, {1, 1, :red})
    refute collides?(gutter, {1, 2, :red})
    assert collides?(gutter, [{1, 2, :red}, {1, 1, :red}])
    refute collides?(gutter, [{1, 2, :red}, {1, 3, :red}])
  end

  test "various merges" do
    gutter = %{{1, 1} => {1, 1, :blue}}

    actual = merge(gutter, [{1, 2, :red}, {1, 3, :red}])

    expected = %{
      {1, 1} => {1, 1, :blue},
      {1, 2} => {1, 2, :red},
      {1, 3} => {1, 3, :red}
    }

    assert actual == expected
  end
end
