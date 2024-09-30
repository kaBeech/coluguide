defmodule GuideMeWeb.CRUDLive do
  use GuideMeWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter gap1">
      <h1>CRUD</h1>
      <ul>
        <.link navigate={~p"/chapters"}>Chapters</.link>
        <.link navigate={~p"/guides"}>Guides</.link>
        <.link navigate={~p"/steps"}>Steps</.link>
        <.link navigate={~p"/step_images"}>Step Images</.link>
        <.link navigate={~p"/details_links"}>Details Links</.link>
        <.link navigate={~p"/reviewed_guides"}>Reviewed Guides</.link>
        <.link navigate={~p"/images"}>Images</.link>
      </ul>
    </div>
    """
  end

  def handle_event("search", %{"query" => query}, socket) do
    socket = assign(socket, :search_query, query)
    GuideMeWeb.Search.search_guides(query, socket)
  end

  @impl true
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
