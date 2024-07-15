defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
  import Step

  alias Guideme.{Guides}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:guide, Guides.get_guide!(id))}
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

  def render(assigns) do
    ~H"""
    <div class="flex column alignCenter textBigger">
      <%= if @guide.template == "chapter" do %>
        <div class="flex justifyCenter gap1">
          <span class="link">
            
          </span>
          <span class="link">
            
          </span>
          <span class="link">
            
          </span>
          <span>
            <input type="checkbox" />
          </span>
        </div>
        <h2>
          Please select an option below by clicking an <span class="link">orange file </span>
        </h2>
      <% end %>
      <h1>
        <%= @guide.title %>
      </h1>
      <div class="flex column justifyCenter widthFit gap1">
        <%= for step <- enumerate_steps(example_steps()) do %>
          <%= render_step(step) %>
        <% end %>
      </div>
    </div>
    """
  end
end
