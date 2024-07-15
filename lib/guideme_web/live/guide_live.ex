defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
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

  defp example_steps do
    [
      %{
        full_text: "Step 1",
        number: 1,
        external_link:
          "https://www.hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-attributes",
        image: nil,
        details_link: nil
      },
      %{
        full_text: "This is Step 2",
        number: 2,
        external_link: nil,
        image: "example_image.png",
        details_link: nil
      },
      %{
        full_text: "Step 3",
        number: 3,
        external_link: nil,
        image: nil,
        details_link: "test_guide_id"
      }
    ]
  end

  defp enumerate_steps(steps_raw) do
    steps_raw
    |> Enum.with_index(1)
    |> Enum.map(fn {e, i} -> Map.put(e, :number, to_string(i)) end)
  end

  defp map_sql_result(%{rows: rows, columns: columns}) do
    Enum.map(rows, fn row ->
      Enum.zip(columns, row)
      |> Enum.into(%{})
    end)
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
