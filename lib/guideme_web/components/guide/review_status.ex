defmodule GuidemeWeb.Guide.ReviewStatus do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  defp needs_review(reviewed_guide, guide) do
    if reviewed_guide["review_assigned_by_id"] and
         reviewed_guide["reviewed_at"] < guide["updated_for_review_at"] do
      true
    else
      false
    end
  end

  def render_status(assigns) do
    ~H"""
    <div class="flex column gap1">
      <p>Last updated: <%= @guide["updated_for_review_at"] %></p>
      <%= if @reviewed_guide do %>
        <p>Last reviewed: <%= @reviewed_guide["reviewed_at"] %></p>
        <%= if needs_review(@reviewed_guide, @guide) do %>
          <p>
            Needs review!
          </p>
        <% end %>
      <% end %>
      <p
        class="link pointer"
        phx-click={JS.push("review_guide")}
        data-confirm="Confirm review of this Guide?"
      >
        Review Guide
      </p>
    </div>
    """
  end

  def handle_event("review_guide", _params, _socket) do
    {:ok, _} = review_guide()
  end

  defp review_guide do
    # Review guide TBA
  end
end
