defmodule GuidemeWeb.AllGuidesLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_guides())}
  end

  def render(assigns) do
    ~H"""
    <div class="flex textBigger justifyCenter gap1">
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
    <h3>
      All Guides
    </h3>
    <ul>
      <%= for guide <- @guides do %>
        <li><%= guide.title %></li>
      <% end %>
    </ul>
    <h3>
      Chapters
    </h3>
    <ul>
      <%= for guide <- @guides do %>
        <%= if guide.category == "chapter" do %>
          <li><%= guide.title %><%= guide.icon %></li>
        <% end %>
      <% end %>
    </ul>
    """
  end
end
