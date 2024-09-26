defmodule GuidemeWeb.Guide.ReviewStatus do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  defp get_review_status(reviewed_guide, guide) do
    if is_nil(reviewed_guide) do
      "Unreviewed"
    else
      if guide.updated_for_review_at &&
           reviewed_guide.reviewed_at < guide.updated_for_review_at do
        if reviewed_guide.review_assigned_by_id do
          "Needs review!"
        else
          "Review Stale"
        end
      else
        "Reviewed"
      end
    end
  end

  defp get_last_review_date(reviewed_guide) do
    if reviewed_guide do
      reviewed_guide.reviewed_at
    else
      "Never"
    end
  end

  def render_status(assigns) do
    ~H"""
    <p class="marginTop2 marginRight1Point5">
      <span class="textDull">
        <%= case get_review_status(@reviewed_guide, @guide) do
          "Unreviewed" -> "•"
          "Needs review!" -> ""
          "Review Stale" -> ""
          "Reviewed" -> ""
        end %>
      </span>
      <span class="link pointer" phx-click={JS.toggle(to: "#guide_review_details")}>
        󰷊
      </span>
      <span class={
        if get_review_status(@reviewed_guide, @guide) == "Needs review!" do
          "borderAlert"
        end
      }>
        <%= get_review_status(@reviewed_guide, @guide) %>
      </span>
    </p>
    <div id="guide_review_details" class="hidden widthFit paddingTop1">
      <div class="flex column gap1 alignCenter">
        <p>
          Last reviewed: <%= get_last_review_date(@reviewed_guide) %>
        </p>
        <p>
          Last updated: <%= @guide.updated_for_review_at || @guide.inserted_at %>
        </p>
        <p
          class="link pointer"
          phx-click={JS.push("review_guide")}
          data-confirm="Confirm review of this Guide?"
        >
          Review Guide
        </p>
      </div>
    </div>
    """
  end
end
