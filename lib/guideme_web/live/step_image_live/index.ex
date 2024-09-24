defmodule GuidemeWeb.StepImageLive.Index do
  use GuidemeWeb, :live_view

  alias Guideme.Steps
  alias Guideme.Steps.StepImage

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :step_images, Steps.list_step_images())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Step image")
    |> assign(:step_image, Steps.get_step_image!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Step image")
    |> assign(:step_image, %StepImage{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Step images")
    |> assign(:step_image, nil)
  end

  @impl true
  def handle_info({GuidemeWeb.StepImageLive.FormComponent, {:saved, step_image}}, socket) do
    {:noreply, stream_insert(socket, :step_images, step_image)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    step_image = Steps.get_step_image!(id)
    {:ok, _} = Steps.delete_step_image(step_image)

    {:noreply, stream_delete(socket, :step_images, step_image)}
  end
end
