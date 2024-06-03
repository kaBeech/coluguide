defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guide: nil)}
  end

  def example_steps do
    [
      %{
        full_text: "Step 1"
      },
      %{
        full_text: "Step 2"
      },
      %{
        full_text: "Step 3"
      }
    ]
  end

  def render_step(assigns) do
    ~H"""
    <div class="flex textBigger justifyCenter gap1">
      <span id="link1" phx-click="toggle" phx-value-to="#link1" class="link">
        
      </span>
      <span class="link">
        
      </span>
      <span class="link">
        
      </span>
      <span>
        <input type="checkbox" />
      </span>
      <span class="marginBottom1">
        <%= @full_text %>
      </span>
    </div>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="flex textBigger justifyCenter gap1">
      <span id="link1" phx-click="toggle" phx-value-to="#link1" class="link">
        
      </span>
      <span class="link">
        
      </span>
      <span class="link">
        
      </span>
      <span>
        <input type="checkbox" />
      </span>
    </div>
    <h2>
      Please select an option below by clicking an <span class="link">orange file </span>
    </h2>
    <%= for step <- [
      %{
        full_text: "Step 1"
      },
      %{
        full_text: "Step 2"
      },
      %{
        full_text: "Step 3"
      }
    ] do %>
      <%= render_step(step) %>
    <% end %>
    """
  end

  def handle_event("toggle", %{"to" => to}, socket) do
    JS.toggle(to: to)
    {:noreply, socket}
  end
end
