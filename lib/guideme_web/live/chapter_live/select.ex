defmodule GuideMeWeb.ChapterLive.Select do
  use GuideMeWeb, :live_view

  import NavBar

  alias GuideMe.{Guides}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guides: Guides.list_chapter_titles_for_selection())}
  end

  def handle_event("search", %{"query" => query}, socket) do
    socket = assign(socket, :search_query, query)
    GuideMeWeb.Search.search_guides(query, socket)
  end

  def handle_event("clear_search", _params, socket) do
    {:noreply,
     socket
     |> assign(:form, to_form(%{"query" => ""}))
     |> assign(:search_results, [])}
  end
end
