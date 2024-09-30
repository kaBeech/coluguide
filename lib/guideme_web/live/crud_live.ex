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
        <.link navigate={~p"/chapters"}>Chapters</.link>
        <.link navigate={~p"/guides"}>Guides</.link>
        <.link navigate={~p"/steps"}>Steps</.link>
        <.link navigate={~p"/step_images"}>Step Images</.link>
        <.link navigate={~p"/details_links"}>Details Links</.link>
        <.link navigate={~p"/reviewed_guides"}>Reviewed Guides</.link>
        <.link navigate={~p"/images"}>Images</.link>
      </ul>
    </div>
    """
  end
end
