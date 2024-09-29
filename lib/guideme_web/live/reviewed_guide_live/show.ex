defmodule GuideMeWeb.ReviewedGuideLive.Show do
  use GuideMeWeb, :live_view

  alias GuideMe.ReviewRecords

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:reviewed_guide, ReviewRecords.get_reviewed_guide!(id))}
  end

  defp page_title(:show), do: "Show Reviewed guide"
  defp page_title(:edit), do: "Edit Reviewed guide"
end
