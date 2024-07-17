defmodule GuidemeWeb.DetailsLinkLive.Index do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.Steps
  alias Guideme.Steps.DetailsLink

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :details_links, Steps.list_details_links())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Details link")
    |> assign(:details_link, Steps.get_details_link!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Details link")
    |> assign(:details_link, %DetailsLink{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Details links")
    |> assign(:details_link, nil)
  end

  @impl true
  def handle_info({GuidemeWeb.DetailsLinkLive.FormComponent, {:saved, details_link}}, socket) do
    {:noreply, stream_insert(socket, :details_links, details_link)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    details_link = Steps.get_details_link!(id)
    {:ok, _} = Steps.delete_details_link(details_link)

    {:noreply, stream_delete(socket, :details_links, details_link)}
  end
end
