defmodule ColuguideWeb.Search do
  use ColuguideWeb, :live_component
  use Phoenix.Component

  def render_search_guides(assigns) do
    ~H"""
    <%= if allow_search_guides(assigns) do %>
      <.form for={@form} phx-change="search" phx-window-keyup="keyup" phx-click-away="clear_search">
        <.input id="searchGuides" type="text" field={@form["query"]} placeholder="Search Guides" />
      </.form>
      <%= if !@search_guides_focused do %>
        <div phx-window-keydown={JS.focus(to: "#searchGuides")} id="keydownController"></div>
        <div phx-window-keydown="focus_search"></div>
      <% end %>
    <% end %>
    """
  end

  def render_search_results(assigns) do
    ~H"""
    <%= if allow_search_guides(assigns) do %>
      <%= if @search_guides_focused && !@search_query do %>
        <div class="dimScreenImageHolder" phx-click-away="clear_search">
          <section class="searchResultsContainer flex column alignCenter imageBorder">
            <h2>Coluguide Hints</h2>
            <ul class="textBigger alignCenter widthFit gap1 textAccent">
              <li>Start typing to search for Guides.</li>
              <li>
                Refresh the page and then press any key to bring up this screen.
              </li>
              <li>
                Things will happen when you
                click <span class="link">orange stuff</span> (usually).
              </li>
              <li>
                <span class="link">  orange links</span> 
                open a relevent external website in a new tab.
              </li>
              <li>
                <span class="link">  orange pictures</span> show an 
                explanatory image.
              </li>
              <li>
                <span class="link">  orange files</span> link to Guides
                with more details about the associated Step.
              </li>
              <li>
                <input type="checkbox" />
                Checkboxes don't do anything, but they can be satisfying to click on!
              </li>
              <li>
                <span class="link">  orange globes</span> show Guides that
                link to the current one.
              </li>
              <li>
                <span class="link">󰷊  orange review icons</span> Show the
                current Guide's review status.
              </li>
              <li>
                There's a <span class="link">  User Menu </span> in the upper
                right corner of the screen.
              </li>
              <li>Click anywhere to close this window.</li>
              <li>Have fun!</li>
            </ul>
          </section>
        </div>
      <% end %>
      <%= if length(@search_results) > 0 do %>
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
    <% end %>
    """
  end

  defp allow_search_guides(assigns) do
    assigns.current_user && assigns.search_guides_enabled
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

    {:noreply,
     socket
     |> assign(:search_guides_focused, true)
     |> assign(:search_results, search_results)}
  end

  def clear_search(socket) do
    {:noreply,
     socket
     |> assign(:form, to_form(%{"query" => ""}))
     |> assign(:search_results, [])
     |> assign(:search_guides_focused, false)
     |> assign(:search_query, nil)}
  end
end
