defmodule Step do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  defp get_last_char(text) do
    String.slice(text, -2..-1)
  end

  def render_step(assigns) do
    ~H"""
    <div class="flex justifyLeft gap1">
      <span class="textDull">
        
      </span>
      <span class="textDull">
        
      </span>
      <span class="textDull">
        
      </span>
      <span>
        <input type="checkbox" />
      </span>
      <span class="textDull"><%= get_last_char(@full_text) %>.</span>
      <%= @full_text %>
    </div>
    """
  end
end
