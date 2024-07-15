defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  import ConvertSQL
  import HeaderTutorial
  import Step

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

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter textBigger">
      <%= if @guide.template_id == 1 do %>
        <%= render_header_tutorial(assigns) %>
      <% end %>
      <h1>
        <%= @guide.title %>
      </h1>
      <ul>
        <%= render_steps(assigns) %>
      </ul>
    </div>
    """
  end
end
