defmodule NavBar do
  use GuideMeWeb, :html
  use Phoenix.Component

  defp style_backlinks_icon(template_id) do
    if template_id == 1 do
      "textDull"
    else
      "link pointer"
    end
  end

  def render_navbar(assigns) do
    ~H"""
    <nav class="flex justifyCenter gap1 widthFull marginTop2 marginRight1Point5">
      <a href="javascript:window.history.back();"><%= "<-- Back" %></a>
      <span class="textDull">|</span>
      <%= if @backlinks_enabled  do %>
        <span phx-click="get_backlinks" class={style_backlinks_icon(@guide.template_id)}> </span>
        <span class="textDull">|</span>
      <% end %>
      <.link navigate="/">Home</.link>
    </nav>
    <%= if length(@backlinks) > 0 do %>
      <div class="dimScreenImageHolder" phx-click="clear_backlinks">
        <section class="searchResultsContainer imageBorder">
          <h2>Backlinks:</h2>
          <ul class="searchResultsList">
            <%= for backlink <- @backlinks do %>
              <li>
                <.link navigate={~p"/guide/#{backlink.id}"}>
                  <%= backlink.name %>
                </.link>
              </li>
            <% end %>
          </ul>
        </section>
      </div>
    <% end %>
    """
  end
end
