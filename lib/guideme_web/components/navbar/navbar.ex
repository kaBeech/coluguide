defmodule NavBar do
  use GuideMeWeb, :html
  use Phoenix.Component

  def render_navbar(assigns) do
    ~H"""
    <nav class="flex justifyCenter gap1 widthFull marginTop2 marginRight1Point5">
      <.link navigate="javascript:window.history.back();"><%= "<-- Back" %></.link>
      <span class="textDull">|</span>
      <.link navigate="/">Home</.link>
    </nav>
    """
  end
end
