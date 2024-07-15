defmodule Step do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def render_step(assigns) do
    ~H"""
    <div class="flex justifyLeft gap1">
      <%= if @external_link do %>
        <a href={@external_link} target="_blank" rel="noopener noreferrer">
          
        </a>
      <% else %>
        <span class="textDull">
          
        </span>
      <% end %>
      <%= if @image do %>
        <span class="link pointer" phx-click={JS.toggle(to: "#image-step" <> to_string(@number))}>
          
        </span>
        <div
          id={"image-step"  <> to_string(@number)}
          phx-click={JS.toggle(to: "#image-step" <> to_string(@number))}
          class="hidden"
        >
          <div class="dimScreenImageHolder">
            <img class="textDull" src={"/images/" <> @image} />
          </div>
        </div>
      <% else %>
        <span class="textDull">
          
        </span>
      <% end %>
      <%= if @details_link do %>
        <a href={"/guide/" <> @details_link}>
          
        </a>
      <% else %>
        <span class="textDull">
          
        </span>
      <% end %>
      <span>
        <input type="checkbox" />
      </span>
      <span class="textDull"><%= @number %>.</span>
      <%= @full_text %>
    </div>
    """
  end
end
