defmodule GuideMeWeb.Search do
  use GuideMeWeb, :live_component
  use Phoenix.Component

  def render_search_guides(assigns) do
    ~H"""
    <%= if @current_user do %>
      <.form for={@form} phx-change="search">
        <p>
          Search cache last updated: <%= @last_cached %>
        </p>
        <.input type="text" field={@form[:query]} />
      </.form>
      <%= for guide <- @search_results do %>
        <p><%= guide.name %></p>
      <% end %>
    <% end %>
    """
  end

  def search_guides(query, socket) do
    search_results =
      Enum.filter(GuideMe.Guides.list_guides(), fn guide ->
        String.contains?(guide.name, query)
      end)

    {:noreply, assign(socket, :search_results, search_results)}
  end
end
