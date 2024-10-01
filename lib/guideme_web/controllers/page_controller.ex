defmodule GuideMeWeb.PageController do
  use GuideMeWeb, :controller

  def assign_guide_review_statistics(socket) do
    # TODO: Yo. Make this one query, silly.
    my_reviewed_guides =
      GuideMe.ReviewRecords.list_my_reviewed_guides(socket.assigns.current_user.id)

    my_guides = GuideMe.Guides.list_guides_for_my_reviews()

    {needs_review, _, _, _} =
      GuideMeWeb.Guide.ReviewStatus.sort_guides_by_review_status(
        my_reviewed_guides,
        my_guides,
        [],
        [],
        []
      )

    %{name: "Needs Review!", guides: needs_review, action: "select_needs_review"}
  end

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, assigns: assign_guide_review_statistics(conn))
  end
end
