defmodule GuidemeWeb.GuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
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
      <ul>
        <%= for step <- @steps do %>
          <div class="flex justifyLeft gap1">
            <%= if step["external_link"] do %>
              <a href={step["external_link"]} target="_blank" rel="noopener noreferrer">
                
              </a>
            <% else %>
              <span class="textDull">
                
              </span>
            <% end %>
            <%= if step["src"] do %>
              <span
                class="link pointer"
                phx-click={JS.toggle(to: "#image-step" <> to_string(step["number"]))}
              >
                
              </span>
              <div
                id={"image-step"  <> to_string(step["number"])}
                phx-click={JS.toggle(to: "#image-step" <> to_string(step["number"]))}
                class="hidden"
              >
                <div class="dimScreenImageHolder">
                  <img class="textDull" src={"/images/" <> step["src"]} alt={step["alt"]} />
                </div>
              </div>
            <% else %>
              <span class="textDull">
                
              </span>
            <% end %>
            <%= if step["guide_id"] do %>
              <a href={"/guide/" <> to_string(step["guide_id"])}>
                
              </a>
            <% else %>
              <span class="textDull">
                
              </span>
            <% end %>
            <span>
              <input type="checkbox" />
            </span>
            <span class="textDull"><%= step["number"] %>.</span>
            <%= step["full_text"] %>
          </div>
        <% end %>
      </ul>
    </div>
    """
  end
end
