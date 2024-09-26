defmodule NavBar do
  use GuidemeWeb, :html
  use Phoenix.Component

  def render_navbar(assigns) do
    ~H"""
    <nav class="flex justifyCenter gap1 widthMax marginTop2 marginRight1Point5">
      <a href="javascript:window.history.back();"><%= "<-- Back" %></a>
      <span class="textDull">|</span>
      <a href="/">Home</a>
    </nav>
    """
  end
end
