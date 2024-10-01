defmodule GuideMeWeb.Search do
  use GuideMeWeb, :live_component
  use Phoenix.Component

  def clear_search(socket) do
    {:noreply,
     socket
     |> assign(:form, to_form(%{"query" => ""}))
     |> assign(:search_results, [])
     |> assign(:search_guides_focused, false)}
  end

  defp allow_search_guides(assigns) do
    assigns.current_user && assigns.search_guides_enabled
  end

  def render_search_guides(assigns) do
    ~H"""
    <%= if allow_search_guides(assigns) do %>
      <.form for={@form} phx-change="search" phx-window-keyup="keyup" phx-click-away="clear_search">
        <.input id="searchGuides" type="text" field={@form["query"]} placeholder="Search Guides" />
      </.form>
      <%= if !@search_guides_focused do %>
        <div phx-window-keydown={JS.focus(to: "#searchGuides")} id="keydownController"></div>
      <% end %>
    <% end %>
    """
  end

  def render_search_results(assigns) do
    ~H"""
    <%= if allow_search_guides(assigns) && length(@search_results) > 0 do %>
      <div class="dimScreenImageHolder" phx-click-away="clear_search">
        <section class="searchResultsContainer imageBorder">
          <h2>Searching Guides for "<%= @search_query %>":</h2>
          <ul class="searchResultsList">
            <%= for guide <- @search_results do %>
              <li>
                <.link navigate={~p"/guide/#{guide.id}"}>
                  <%= guide.name %>
                </.link>
              </li>
            <% end %>
          </ul>
        </section>
      </div>
    <% end %>
    """
  end

  def search_guides(query, socket) do
    query_words = String.split(query, " ")

    guide_names_with_all_query_words =
      Enum.filter(socket.assigns.guide_names, fn guide ->
        Enum.all?(query_words, fn query_word ->
          String.contains?(String.downcase(guide.name), String.downcase(query_word))
        end)
      end)

    steps_with_all_query_words =
      Enum.filter(socket.assigns.step_texts, fn step ->
        Enum.all?(query_words, fn query_word ->
          String.contains?(String.downcase(step.full_text), String.downcase(query_word))
        end)
      end)

    guides_with_query_in_steps_but_not_name =
      Enum.filter(socket.assigns.guide_names, fn guide ->
        Enum.any?(steps_with_all_query_words, fn step ->
          step.guide_id == guide.id &&
            !Enum.any?(guide_names_with_all_query_words, fn guide_name ->
              guide_name.id == guide.id
            end)
        end)
      end)

    search_results =
      guide_names_with_all_query_words ++ guides_with_query_in_steps_but_not_name

    {:noreply, assign(socket, :search_results, search_results)}
  end
end
