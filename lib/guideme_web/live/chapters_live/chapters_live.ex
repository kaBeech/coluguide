defmodule GuidemeWeb.ChaptersLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  import NavBar

  alias Guideme.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_guides())}
  end

  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter">
      <h1>Chapters</h1>
      <ul class="flex row wrap">
        <%= for guide <- @guides do %>
          <%= if guide.template_id == 1 do %>
            <li class="flex column alignCenter">
              <a class="logo glow" href={"/guides/" <> to_string(guide.id)}>
                <span class="logoFont"><%= guide.icon %></span>
              </a>
              <p class="lineHeightBigger textBright">
                <%= guide.name %>
              </p>
            </li>
          <% end %>
        <% end %>
      </ul>
      <div class="flex justifyCenter marginTop2">
        <%= render_navbar(assigns) %>
      </div>
    </div>
    """
  end
end
