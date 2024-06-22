defmodule GuidemeWeb.StepLive.Show do
  use GuidemeWeb, :live_view

  alias Guideme.Steps

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:step, Steps.get_step!(id))}
  end

  defp page_title(:show), do: "Show Step"
  defp page_title(:edit), do: "Edit Step"
end
