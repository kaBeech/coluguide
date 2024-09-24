defmodule GuidemeWeb.ReviewedGuideLive.Index do
  use GuidemeWeb, :live_view

  alias Guideme.ReviewRecords
  alias Guideme.ReviewRecords.ReviewedGuide

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :reviewed_guides, ReviewRecords.list_reviewed_guides())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Reviewed guide")
    |> assign(:reviewed_guide, ReviewRecords.get_reviewed_guide!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Reviewed guide")
    |> assign(:reviewed_guide, %ReviewedGuide{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Reviewed guides")
    |> assign(:reviewed_guide, nil)
  end

  @impl true
  def handle_info(
        {GuidemeWeb.ReviewedGuideLive.FormComponent, {:saved, reviewed_guide}},
        socket
      ) do
    {:noreply, stream_insert(socket, :reviewed_guides, reviewed_guide)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    reviewed_guide = ReviewRecords.get_reviewed_guide!(id)
    {:ok, _} = ReviewRecords.delete_reviewed_guide(reviewed_guide)

    {:noreply, stream_delete(socket, :reviewed_guides, reviewed_guide)}
  end
end
