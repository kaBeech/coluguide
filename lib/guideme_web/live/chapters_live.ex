defmodule GuidemeWeb.ChaptersLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_guides())}
  end

  def render(assigns) do
    ~H"""
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
