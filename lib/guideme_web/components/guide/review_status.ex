defmodule GuidemeWeb.Guide.ReviewStatus do
  use GuidemeWeb, :html
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def render_status(assigns) do
    ~H"""
    <p class={
      "marginTop2" <>
      if get_review_status(@reviewed_guide, @guide) == "Needs review!" do
        " borderAlert"
      else
        ""
      end
    }>
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

  @doc """
  Sorts guides by review status, returning the lists of guides in this order:
  needs_review, stale, reviewed, and unreviewed.

  ## Examples

      iex> sort_guides_by_review_status(reviews, guides, needs_review, stale, reviewed)
      {needs_review, stale, reviewed, unreviewed}
  """
  def sort_guides_by_review_status(
        reviews,
        guides,
        needs_review,
        stale,
        reviewed
      ) do
    Enum.reduce(
      reviews,
      {needs_review, stale, reviewed, guides},
      fn reviewed_guide, {needs_review, stale, reviewed, guides} ->
        guide =
          Enum.find(
            guides,
            raise("Guide not found for reviewed guide: #{inspect(reviewed_guide)}"),
            &(&1.id == reviewed_guide.guide_id)
          )

        remaining_guides = Enum.reject(guides, &(&1.id == guide.id))
        review_status = get_reviewed_status(reviewed_guide, guide)

        case review_status do
          "Needs Review!" ->
            {needs_review ++ [guide], stale, reviewed, remaining_guides}

          "Review Stale" ->
            {needs_review, stale ++ [guide], reviewed, remaining_guides}

          "Reviewed" ->
            {needs_review, stale, reviewed ++ [guide], remaining_guides}

          _ ->
            raise("Invalid review status: #{inspect(review_status)} for guide: #{guide.id}")
        end
      end
    )
  end

  defp get_review_status(reviewed_guide, guide) do
    if is_nil(reviewed_guide) do
      "Unreviewed"
    else
      get_reviewed_status(reviewed_guide, guide)
    end
  end

  defp get_reviewed_status(reviewed_guide, guide) do
    case {reviewed_guide.reviewed_at, reviewed_guide.review_assigned_by_id,
          guide.updated_for_review_at, guide.inserted_at} do
      {nil, _, _, _} ->
        "Needs Review!"

      {_, nil, nil, _} when reviewed_guide.reviewed_at < guide.inserted_at ->
        "Review Stale"

      {_, nil, _, _} when reviewed_guide.reviewed_at < guide.updated_for_review_at ->
        "Review Stale"

      {_, _, nil, _} when reviewed_guide.reviewed_at < guide.inserted_at ->
        "Needs Review!"

      {_, _, _, _} when reviewed_guide.reviewed_at < guide.updated_for_review_at ->
        "Needs Review!"

      {_, _, _, _} ->
        "Reviewed"
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
end
