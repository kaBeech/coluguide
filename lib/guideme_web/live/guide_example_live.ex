defmodule GuidemeWeb.GuideExampleLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
  import Step

  def mount(_params, _session, socket) do
    {:ok, assign(socket, guide: nil)}
  end

  defp example_steps do
    [
      %{
        full_text: "Step 1",
        external_link:
          "https://www.hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-attributes",
        image: nil,
        details_link: nil
      },
      %{
        full_text: "This is Step 2",
        external_link: nil,
        image: "https://www.wikipedia.org/portal/wikipedia.org/assets/img/Wikipedia-logo-v2.png",
        details_link: nil
      },
      %{
        full_text: "Step 3",
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
      <div class="flex column justifyCenter widthFit gap1">
        <%= for step <- enumerate_steps(example_steps()) do %>
          <%= render_step(step) %>
        <% end %>
      </div>
    </div>
    """
  end
end
