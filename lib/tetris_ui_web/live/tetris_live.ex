defmodule TetrisUiWeb.TetrisLive do
  use Phoenix.LiveView
  use Phoenix.HTML, only: [raw: 1]

  alias Tetris.Brick

  @spec mount(any, any, Phoenix.LiveView.Socket.t()) :: {:ok, any}
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(socket,
        tetromino: Brick.new_random() |> Brick.to_string()
      )
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <pre><%= @tetromino %></pre>
    """
  end
end
