defmodule TetrisUiWeb.TetrisLive do
  use Phoenix.LiveView
  use Phoenix.HTML, only: [raw: 1]

  def mount(_session, socket) do
    {
      :ok,
      assign(socket,
        hello: :world,
        name: :joe
      )
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
      <h1>Hello, <%= @hello %> <%= @name %></h1>
    """
  end
end
