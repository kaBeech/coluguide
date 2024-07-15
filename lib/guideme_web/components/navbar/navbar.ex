defmodule NavBar do
  use GuidemeWeb, :html
  use Phoenix.Component

  def render_navbar(assigns) do
    ~H"""
    <nav class="flex justifyLeft gap1 widthMax marginTop2">
      <a href="javascript:window.history.back();"><%= "<-- Back" %></a>
      <span class="textDull">|</span>
      <a href="/">Home</a>
    </nav>
    """
  end
end
