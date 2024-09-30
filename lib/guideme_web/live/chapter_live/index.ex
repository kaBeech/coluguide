defmodule GuideMeWeb.ChapterLive.Index do
  use GuideMeWeb, :live_view

  alias GuideMe.Chapters
  alias GuideMe.Chapters.Chapter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :chapters, Chapters.list_chapters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Chapter")
    |> assign(:chapter, Chapters.get_chapter!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Chapter")
    |> assign(:chapter, %Chapter{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Chapters")
    |> assign(:chapter, nil)
  end

  @impl true
  def handle_info({GuideMeWeb.ChapterLive.FormComponent, {:saved, chapter}}, socket) do
    {:noreply, stream_insert(socket, :chapters, chapter)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    chapter = Chapters.get_chapter!(id)
    {:ok, _} = Chapters.delete_chapter(chapter)

    {:noreply, stream_delete(socket, :chapters, chapter)}
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
