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
      <span class="textDull" phx-click={JS.toggle(to: "#image-step" <> @number)}>
        
      </span>
      <span id={"image-step" <> @number} class="textDull hidden">
        IMAGE!
      </span>
      <span class="textDull">
        
      </span>
      <span>
        <input type="checkbox" />
      </span>
      <span class="textDull"><%= @number %>.</span>
      <%= @full_text %>
    </div>
    """
  end
end
