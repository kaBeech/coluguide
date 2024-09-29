defmodule Step do
  use GuideMeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def render_steps(assigns) do
    ~H"""
    <%= for step <- @steps do %>
      <div class="flex justifyLeft gap1">
        <%= if step["external_link"] do %>
          <a href={step["external_link"]} target="_blank" rel="noopener noreferrer">
            
          </a>
        <% else %>
          <span class="textDull">
            
          </span>
        <% end %>
        <%= if step["src"] do %>
          <span
            class="link pointer"
            phx-click={JS.toggle(to: "#image-step" <> to_string(step["number"]))}
          >
            
          </span>
          <div
            id={"image-step"  <> to_string(step["number"])}
            phx-click={JS.toggle(to: "#image-step" <> to_string(step["number"]))}
            class="hidden"
          >
            <div class="dimScreenImageHolder">
              <img
                class="textDull imageBorder imageAutoSize"
                src={"/images/" <> step["src"]}
                alt={step["alt"]}
              />
            </div>
          </div>
        <% else %>
          <span class="textDull">
            
          </span>
        <% end %>
        <%= if step["guide_id"] do %>
          <a href={"/guide/" <> to_string(step["guide_id"])}>
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
        <span class="textDull"><%= step["number"] %>.</span>
        <%= step["full_text"] %>
      </div>
    <% end %>
    """
  end
end
