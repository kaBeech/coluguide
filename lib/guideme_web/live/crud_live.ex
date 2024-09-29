defmodule GuideMeWeb.CRUDLive do
  use GuideMeWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter gap1">
      <h1>CRUD</h1>
      <ul>
        <.link href={~p"/chapters"}>Chapters</.link>
        <.link href={~p"/guides"}>Guides</.link>
        <.link href={~p"/steps"}>Steps</.link>
        <.link href={~p"/step_images"}>Step Images</.link>
        <.link href={~p"/details_links"}>Details Links</.link>
        <.link href={~p"/reviewed_guides"}>Reviewed Guides</.link>
        <.link href={~p"/images"}>Images</.link>
      </ul>
    </div>
    """
  end
end
