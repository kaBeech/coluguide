defmodule GuideMeWeb.Search do
  use GuideMeWeb, :live_component
  use Phoenix.Component

  def render_search_guides(assigns) do
    ~H"""
    <%= if @current_user do %>
      <.form for={@form} phx-change="search" phx-click-away="clear_search">
        <.input type="text" field={@form["query"]} />
      </.form>
    <% end %>
    """
  end

  def render_search_results(assigns) do
    ~H"""
    <%= if @current_user && length(@search_results) > 0 do %>
      <div class="dimScreenImageHolder" phx-click-away="clear_search">
        <section class="searchResultsContainer imageBorder">
          <h2>Searching Guides for "<%= @search_query %>":</h2>
          <ul class="searchResultsList">
            <%= for guide <- @search_results do %>
              <li><%= guide.name %></li>
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
