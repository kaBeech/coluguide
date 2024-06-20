defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
  import Step

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

  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter textBigger">
      <div class="flex justifyCenter gap1">
        <span class="link">
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
end
