defmodule Step do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

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
      <span class="textDull"><%= @number %>.</span>
      <%= @full_text %>
    </div>
    """
  end
end
