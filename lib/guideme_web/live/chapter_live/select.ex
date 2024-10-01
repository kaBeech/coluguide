defmodule GuideMeWeb.ChapterLive.Select do
  use GuideMeWeb, :live_view

  import NavBar
  import GuideMeWeb.Search

  alias GuideMe.{Guides}

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(guides: Guides.list_chapter_titles_for_selection())
     |> assign(:search_guides_enabled, true)}
  end

  def handle_event("search", %{"query" => query}, socket) do
    socket = assign(socket, :search_query, query)
    GuideMeWeb.Search.search_guides(query, socket)
  end

  def handle_event("clear_search", _params, socket) do
    clear_search(socket)
  end

  def handle_event("keyup", %{"key" => "Escape"}, socket) do
    {:noreply,
     socket
     |> assign(:form, to_form(%{"query" => ""}))
     |> assign(:search_results, [])}
  end

  def handle_event("keyup", _, socket) do
    {:noreply, socket}
  end
end
