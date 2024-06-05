defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guide: nil)}
  end

  defp example_steps do
    [
      %{
        full_text: "Step 1"
      },
      %{
        full_text: "This is Step 2"
      },
      %{
        full_text: "Step 3"
      }
    ]
  end

  defp get_last_char(text) do
    String.slice(text, -2..-1)
  end

  def render_step(assigns) do
    ~H"""
    <div class="flex justifyLeft gap1">
      <span id="link1" phx-click="toggle" phx-value-to="#link1" class="textDull">
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

  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter textBigger">
      <div class="flex justifyCenter gap1">
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
      <div class="flex column justifyCenter widthFit gap1">
        <%= for step <- example_steps() do %>
          <%= render_step(step) %>
        <% end %>
      </div>
    </div>
    """
  end

  def handle_event("toggle", %{"to" => to}, socket) do
    JS.toggle(to: to)
    {:noreply, socket}
  end
end
