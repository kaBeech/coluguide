defmodule GuidemeWeb.GuideLive.Guide do
  use GuidemeWeb, :live_view

  import ConvertSQL
  import HeaderTutorial
  import NavBar
  import Step
  # import GuidemeWeb.Guide.ReviewStatus

  alias Guideme.{Guides, Steps}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:guide, Guides.get_guide!(id))
     |> assign(:steps, map_sql_result(Steps.list_guide_steps!(elem(Integer.parse(id), 0))))}
  end
end
