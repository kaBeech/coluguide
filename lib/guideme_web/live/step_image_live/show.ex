defmodule GuideMeWeb.StepImageLive.Show do
  use GuideMeWeb, :live_view

  alias GuideMe.Steps

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:step_image, Steps.get_step_image!(id))}
  end

  defp page_title(:show), do: "Show Step image"
  defp page_title(:edit), do: "Edit Step image"
end
