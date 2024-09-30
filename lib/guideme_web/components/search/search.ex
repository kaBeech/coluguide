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
    guide_names_containing_query =
      Enum.filter(socket.assigns.guide_names, fn guide ->
        String.contains?(String.downcase(guide.name), String.downcase(query))
      end)

    steps_containing_query =
      Enum.filter(socket.assigns.step_texts, fn step ->
        String.contains?(String.downcase(step.full_text), String.downcase(query))
      end)

    guides_with_query_in_steps_but_not_name =
      Enum.filter(socket.assigns.guide_names, fn guide ->
        Enum.any?(steps_containing_query, fn step ->
          step.guide_id == guide.id &&
            !Enum.any?(guide_names_containing_query, fn guide_name ->
              guide_name.id == guide.id
            end)
        end)
      end)

    search_results = guide_names_containing_query ++ guides_with_query_in_steps_but_not_name
    {:noreply, assign(socket, :search_results, search_results)}
  end
end
