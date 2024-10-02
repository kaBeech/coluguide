defmodule ColuguideWeb.DetailsLinkLive.Show do
  use ColuguideWeb, :live_view

  alias Coluguide.Steps

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:details_link, Steps.get_details_link!(id))}
  end

  defp page_title(:show), do: "Show Details link"
  defp page_title(:edit), do: "Edit Details link"
end
