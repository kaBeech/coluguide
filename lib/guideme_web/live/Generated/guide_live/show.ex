defmodule GuidemeWeb.GenGuideLive.Show do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.Guides

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:guide, Guides.get_guide!(id))}
  end

  defp page_title(:show), do: "Show Guide"
  defp page_title(:edit), do: "Edit Guide"
end
