defmodule GuidemeWeb.GuideLive.Index do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.Guides
  alias Guideme.Guides.Guide

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :guides, Guides.list_guides())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_params(%{"chapter_id" => chapter_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:chapter_id, chapter_id)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Guide")
    |> assign(:guide, Guides.get_guide!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Guide")
    |> assign(:guide, %Guide{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Guides")
    |> assign(:guide, nil)
  end

  @impl true
  def handle_info({GuidemeWeb.GuideLive.FormComponent, {:saved, guide}}, socket) do
    {:noreply, stream_insert(socket, :guides, guide)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    guide = Guides.get_guide!(id)
    {:ok, _} = Guides.delete_guide(guide)

    {:noreply, stream_delete(socket, :guides, guide)}
  end
end
