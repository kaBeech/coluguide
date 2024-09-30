defmodule GuideMeWeb.ReviewedGuideLive.Mine do
  use GuideMeWeb, :live_view
  import NavBar

  alias GuideMe.ReviewRecords
  alias GuideMe.Guides
  alias GuideMeWeb.Guide.ReviewStatus

  @impl true
  def mount(_params, _session, socket) do
    my_reviewed_guides = ReviewRecords.list_my_reviewed_guides(socket.assigns.current_user.id)
    my_guides = Guides.list_guides_for_my_reviews()

    {needs_review, stale, reviewed, unreviewed} =
      ReviewStatus.sort_guides_by_review_status(my_reviewed_guides, my_guides, [], [], [])

    {:ok,
     assign(socket,
       needs_review: %{
         name: "Needs Review!",
         guides: needs_review,
         action: "select_needs_review"
       },
       search_guides_enabled: true,
       stale: %{name: "Stale", guides: stale, action: "select_stale"},
       reviewed: %{name: "Reviewed", guides: reviewed, action: "select_reviewed"},
       unreviewed: %{name: "Unreviewed", guides: unreviewed, action: "select_unreviewed"},
       current_selection: nil
     )}
  end

  @impl true
  def handle_info(
        {GuideMeWeb.ReviewedGuideLive.FormComponent, {:saved, reviewed_guide}},
        socket
      ) do
    {:noreply, stream_insert(socket, :reviewed_guides, reviewed_guide)}
  end

  @impl true
  def handle_event("select_needs_review", _, socket) do
    {:noreply, assign(socket, current_selection: "Needs Review!")}
  end

  def handle_event("select_stale", _, socket) do
    {:noreply, assign(socket, current_selection: "Stale")}
  end

  def handle_event("select_reviewed", _, socket) do
    {:noreply, assign(socket, current_selection: "Reviewed")}
  end

  def handle_event("select_unreviewed", _, socket) do
    {:noreply, assign(socket, current_selection: "Unreviewed")}
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
