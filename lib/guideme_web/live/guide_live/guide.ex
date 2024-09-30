defmodule GuideMeWeb.GuideLive.Guide do
  use GuideMeWeb, :live_view

  import ConvertSQL
  import HeaderTutorial
  import NavBar
  import Step
  import GuideMeWeb.Guide.ReviewStatus

  alias GuideMe.{Guides, Steps, ReviewRecords}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        form: to_form(%{query: ""})
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:guide, Guides.get_guide!(id))
     |> assign(:steps, map_sql_result(Steps.list_guide_steps!(elem(Integer.parse(id), 0))))
     |> assign(
       :reviewed_guide,
       ReviewRecords.get_reviewed_guide_by_user_and_guide(
         socket.assigns.current_user.id,
         id
       )
     )}
  end

  def handle_event("search", %{"query" => query}, socket) do
    GuideMeWeb.Search.search_guides(query, socket)
  end

  @impl true
  def handle_event("review_guide", _params, socket) do
    {:ok, _} =
      review_guide(
        socket.assigns.reviewed_guide,
        socket.assigns.guide.id,
        socket.assigns.current_user
      )

    {:noreply,
     socket
     |> assign(
       :reviewed_guide,
       ReviewRecords.get_reviewed_guide_by_user_and_guide(
         socket.assigns.current_user.id,
         socket.assigns.guide.id
       )
     )}
  end

  defp review_guide(reviewed_guide, guide_id, user) do
    if reviewed_guide do
      ReviewRecords.update_reviewed_guide(reviewed_guide, %{
        reviewed_at: DateTime.utc_now()
      })
    else
      ReviewRecords.create_reviewed_guide(user, %{
        guide_id: guide_id,
        reviewed_at: DateTime.utc_now()
      })
    end
  end
end
