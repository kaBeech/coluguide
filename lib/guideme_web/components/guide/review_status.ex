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
          "Needs Review!"
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
      DateTime.to_date(reviewed_guide.reviewed_at)
    else
      "Never"
    end
  end

  defp get_last_updated_date(guide) do
    DateTime.to_date(
      if guide.updated_for_review_at do
        guide.updated_for_review_at
      else
        guide.inserted_at
      end
    )
  end

  def render_status(assigns) do
    ~H"""
    <p class={
      "marginTop2" <>
      if get_review_status(@reviewed_guide, @guide) == "Needs Review!" do
        " borderAlert"
      else
        ""
      end
    }>
      <span class="textDull">
        <%= case get_review_status(@reviewed_guide, @guide) do
          "Unreviewed" -> "•"
          "Needs Review!" -> ""
          "Review Stale" -> ""
          "Reviewed" -> ""
        end %>
      </span>
      <span class="link pointer" phx-click={JS.toggle(to: "#guide_review_details")}>
        󰷊
      </span>
    </p>
    <div id="guide_review_details" class="hidden widthFit paddingTop1">
      <div class="flex column gap1 alignCenter">
        <p>
          <%= get_review_status(@reviewed_guide, @guide) %>
        </p>
        <p class="textSmaller">
          Last reviewed: <%= get_last_review_date(@reviewed_guide) %>
        </p>
        <p class="textSmaller">
          Last updated: <%= get_last_updated_date(@guide) %>
        </p>
        <button
          class="textSmaller"
          phx-click={JS.push("review_guide")}
          data-confirm="Confirm review of this Guide?"
        >
          Review Guide
        </button>
      </div>
    </div>
    """
  end
end
