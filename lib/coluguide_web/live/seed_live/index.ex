defmodule ColuguideWeb.SeedLive do
  @moduledoc """
  This is a hacky workaround to seed the database without using Mix.
  """
  use ColuguideWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex column gap1">
      <h1>Seed Database</h1>
        <.link
          phx-click={JS.push("seed")}
          data-confirm="Are you sure?"
        >
          SEED THE DATABASE!!!
        </.link>
    </div>
    """
  end

  @impl true
  def handle_event("seed", _, _socket) do
    {:ok, _} = seed()
  end

  defp seed do
    # Core data
    Coluguide.Repo.insert!(%Coluguide.Guides.Template{
      name: "chapter"
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Template{
      name: "standard"
    })

    # Use Coluguide - Images

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_template_standard.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_title.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_introduction.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_steps.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_icons.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_icons_active_nonactive.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_external_link.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_image.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_details_link.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_checkbox.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_section.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_rsi.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_needs_review.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_full_review_section.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_button.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_rsi_unreviewed.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_rsi_reviewed.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_rsi_review_stale.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_rsi_needs_review.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_status_unreviewed.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_status_reviewed.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_status_review_stale.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_status_needs_review.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_section_status.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_section_last_reviewed.png"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "guide_review_section_last_updated.png"
    })

    # Use Coluguide - Chapters

    Coluguide.Repo.insert!(%Coluguide.Chapters.Chapter{
      title: "Use Coluguide"
    })

    # Use Coluguide - Guides

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use Coluguide",
      name: "Use Coluguide",
      icon: " ",
      template_id: Coluguide.Guides.get_template_id_by_name!("chapter"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Understand the Coluguide Philosophy",
      name: "Understand the Coluguide Philosophy",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Everything is simple",
      name: "Everything is simple",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Get the right information quickly",
      name: "Get the right information quickly",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Avoid distractions",
      name: "Avoid distractions",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Don't think too hard",
      name: "Don't think too hard",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Good information changes",
      name: "Good information changes",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use a Guide",
      name: "Use a Guide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use Step Icons",
      name: "Use Step Icons",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Review a Guide",
      name: "Review a Guide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Read a Review Status Indicator",
      name: "Read a Guide's Review Status Indicator",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Understand the Review Status State",
      name: "Understand a Guide's Review Status State",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use the Full Review Section",
      name: "Use a Guide's Full Review Section",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "View your Review Statistics",
      name: "View your Review Statistics",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Manage Guide Reviews ",
      name: "Manage Guide Reviews in Coluguide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Create, Update, and Delete Guides",
      name: "Create, Update, and Delete Guides",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use the CRUD section",
      name: "Use the CRUD section",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Use Editor Mode",
      name: "Use Editor Mode",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Enter Editor Mode",
      name: "Enter Editor Mode",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Edit Chapters",
      name: "Edit Chapters",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Edit Guides",
      name: "Edit Guides",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Add a Chapter",
      name: "Add a Chapter",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Make titles and names",
      name: "Make titles and names in Coluguide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })
    
    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Update a Chapter",
      name: "Update a Chapter",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Delete a Chapter",
      name: "Delete a Chapter",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Add a Guide",
      name: "Add a Guide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Open the New Guide screen",
      name: "Open the New Guide screen",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Update a Guide",
      name: "Update a Guide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Delete a Guide",
      name: "Delete a Guide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Add a Step",
      name: "Add a Step",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Update a Step",
      name: "Update a Step",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Delete a Step",
      name: "Delete a Step",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Edit a Step's External Link",
      name: "Edit a Step's External Link",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Edit a Step's Image",
      name: "Edit a Step's Image",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Manage Images",
      name: "Manage Images in Coluguide",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Edit a Step's Details Link",
      name: "Edit a Step's Details Link",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Use Coluguide")
    })

    # Use Coluguide - Steps

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Understand the Coluguide Philosophy",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Use a Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Review a Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "See which Guides have been updated since last review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Assign Guides to Users for review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Create, update, and delete Guides",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Manage Teams (coming soon!)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Coluguide"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Everything is simple",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Get the right information quickly",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Avoid distractions",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Don't think too hard",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Good information changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "A complex system can be understood as a structure of simple
        abstractions",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Everything is simple"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each Guide is short enough to understand",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Everything is simple"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each Step is short enough to understand",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Everything is simple"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "If a Guide or Step gets too complicated, break it down into
        simpler parts",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Everything is simple"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Our jobs require us to have vast amounts of knowledge
      available at a moment's notice",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Get the right information quickly"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Make necessary information quick to find",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Get the right information quickly"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each Guide gives a complete high-level overview of the
        necessary information",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Get the right information quickly"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "When more detail on a Step is needed, a link to a Guide with
        more detail is provided",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Get the right information quickly"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Our jobs require intense focus. Distractions can put
      Patients' lives at risk",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Avoid distractions"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Keep extraneous information to a minimum",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Avoid distractions"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Build applications that operate in a predictable manner",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Avoid distractions"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Comfort and style matter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Avoid distractions"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Our jobs require high levels of critical thinking",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Don't think too hard"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Brainpower spent searching for information could be better
      spent solving problems",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Don't think too hard"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Build applications that can be used with low expense to
      braipower",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Don't think too hard"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "We work in an environment that is constantly evolving",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Good information changes"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Living information changes. When important changes occur,
      Users need to be informed",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Good information changes"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Some small changes may not need to be communicated",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Good information changes"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each Guide's title is shown near the top of the page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Some Guides have introductory information before the Steps 
        begin",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Follow the steps underneath the title",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Use the Step Icons to interact with the Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Step icons are clickable if they're bright orange - dull teal 
        icons are non-clickable placeholders",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      external_link: "https://www.wikipedia.org/",
      full_text: "Clicking an orange   icon will open a relevant external link in 
        a new browser tab",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Clicking an orange   icon will pop up a helpful image related to
        the step",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Clicking an orange   icon will open another guide which covers 
        the step in more detail",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Checkboxes are just there for a bit of pseudo-tactile 
        satisfaction",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each Guide has a Review section near the bottom of the page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The dull teal review indicator gives quick information on a
        Guide's review status",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "If the Guide needs review, the Review section will be
        outlined in orange",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the orange 󰷊 icon to open the full Review
        section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the Review button and confirm that you've reviewed the
        Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The Review Status Indicator changes shape based on the 
        Guide's Review Status state",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "• means 'Unreviewed'",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "✓ means 'Reviewed'",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: " means 'Review Stale'",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "An  with the Review Status Indicator section outlined in
        orange means 'Needs Review'!",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "'Unreviewed' means you have never reviewed the Guide and it is
        not assigned to you for review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "'Reviewed' means you have reviewed a Guide and it has not been
        updated you last reviewed it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "'Review Stale' means the Guide has been updated since your last
        review you, but you are not assigned to review it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "'Needs Review!' means you are assigned to review the Guide, but
        have not reviewed it since its last update",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Clicking the orange 󰷊 icon will show or hide the full Review
        section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The Review Status Indicator changes shape based on the
        Guide's Review Status state",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The Review Status is shown at the top of the Review section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The date you last reviewed the Guide is shown below the
        Review Status",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The date the Guide was last updated is shown below the
        last reviewed date",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the Review button and confirm that you've reviewed the
        Guide to record your review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The Review Status Indicator is outlined in orange if the
        Review Status is Needs Review!",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click My Reviews in the User Menu",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("View your Review Statistics"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Total number of Guides in each Review Status state is shown
        at the top of the page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("View your Review Statistics"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click an orange number to see the Guides in that Review Status
        state",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("View your Review Statistics"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the orange  icon next to a Guide's name to go to that
      Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("View your Review Statistics"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click Assign Reviews in the User Menu (only accessible if you
      are an Admin)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Guide Reviews in Coluguide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Current Reviews for all Users are shown with their current
      Review Status",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Guide Reviews in Coluguide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the orange 'Delete' option next to a Guide's name to
      delete that Guide Review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Guide Reviews in Coluguide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the orange 'Assign New Review' button at the top of the
      page to assign Guides to Users for review",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Guide Reviews in Coluguide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Understand Coluguide's Style Guidelines",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Create, Update, and Delete Guides"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Use the CRUD section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Create, Update, and Delete Guides"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Use Editor Mode (coming soon!)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Create, Update, and Delete Guides"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the CRUD option in the User Menu (only accessible if you are an
        Editor)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Select the type of item you want to create, update, or delete",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Create a new item",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Update an existing item",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Delete an item",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Editor Mode"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Edit Chapters",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Editor Mode"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Edit Guides",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Editor Mode"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Open the User Menu",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Select 'Enter Editor Mode' (only appears if you are an Editor)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Chapter Selection page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon to add a new Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon near a Chapter to update it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the  icon near a Chapter and confirm to delete it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 1
    })
    
    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the    icon on the Chapter Selection page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a unique title for your Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a Nerd Font-compatible icon to represent your Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a title for your Chapter's first Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a unique name for your Chapter's first Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Chapter' button and confirm to create your Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      external_link: "https://en.wikipedia.org/wiki/Imperative_mood",
      full_text: "Titles and names use imperative mood",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Chapter titles and Guide names must be unique",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Guide titles do not need to be unique",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Titles and names should be short and descriptive",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon next to the Chapter you want to update on 
      the Chapter Selection page",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click into the Chapter's title to update it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click into the Chapter's icon to update it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
      number: 4
    })
    
    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Chapter' button and confirm to update your Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "First delete all Guides in the Chapter you want to delete",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Chapter"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Chapter"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the  icon next to the Chapter on the Chapter Selection
      page and confirm to delete it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Chapter"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Guides"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Guides"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Update a Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Guides"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Delete a Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Guides"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Open the New Guide screen",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a title for your Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add a unique name for your Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Choose a Template for your Guide (not that currently this
      cannot be changed after creating the Guide)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add an Introduction for your Guide (optional)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Guide' button and confirm to create your Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Update your newly-created Guide to add Steps",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "If you want to add a new Guide for a Chapter that doesn't
      exist yet, add a new Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to an existing Guide that has a Step you want to
      link to the new Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Make sure that this Step is in the Chapter you want the new
      Guide to be in. Note that currently this cannot be changed after creating
      the Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "If the Step you want to link from doesn't exist yet, create
      it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon near the Step you want to link from",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the  icon for the selected Step",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click 'Create New Guide'.",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
      number: 8
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Guide you want to update",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click into the text of the title, unique name, and introduction to
      update them",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon to add a new Step",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon near a Step to update or delete it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the  and  icons to rearrange Steps",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Check the 'Update for Review' checkbox if you want Users who
      have reviewed the Guide to review it again",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Guide' button and confirm to save your changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
      number: 8
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Guide you want to delete",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Delete all Steps in the Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the  icon near the Guide's title and confirm to delete
      the Guide",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Guide you want the new Step to be in",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon in the Steps section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Add the Step's text",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 4
    })
    
    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Step' button and confirm to create your
      new Step",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Edit the Step to add an External Link, Image, or Details Link
      (optional)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Guide the Step you want to update is in",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon near the Step you want to update",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click into the Step's text to update it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon to edit the External Link",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon to edit the Image",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon to edit the Details Link",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save Step' button and confirm to save your changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
      number: 8
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Navigate to the Guide the Step you want to delete is in",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Step"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter Editor Mode (if you haven't already)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Step"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the   icon near the Step you want to delete and
      confirm to delete it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Step"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Confirm to delete the Step",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Step"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter the Edit screen for the External Link",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's External Link"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To change the External Link, enter a valid URL for the site
      you want to link to in the text field",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's External Link"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To remove the External Link, delete the URL from the text
      field",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's External Link"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save' button and confirm to save your
      changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's External Link"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter the Edit screen for the Step Image",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To add or update the Step Image, choose the image src from the
      dropdown",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The selected image will be shown in the preview",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "All Step Images must include alt text describing the
      image to someone who can't see it",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To remove the Image from this Step, click the  icon",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save' button and confirm to save your changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 6
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To change what Images are available in the dropdown, see the
      Manage Images section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
      number: 7
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Create, update, and delete Image records in the CRUD section",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Images in Coluguide"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "All an Image record needs is a valid src path",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Images in Coluguide"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Currently Images themselves must be managed on the file
      system or CDN directly",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Images in Coluguide"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Image management from within the app coming soon!",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Images in Coluguide"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Enter the Edit screen for the Details Link",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To change the Details Link, choose the name of the Guide you
      want to link to from the dropdown",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The selected Guide will be shown in the preview",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To remove the Details Link from this Step, click the  icon",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Click the 'Save' button and confirm to save your changes",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "To add a new Guide to the dropdown, click the  icon to
      confirm you want to create a new Guide in this Chapter",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
      number: 6
    })

    # Use Coluguide - Step Images

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_template_standard.png"),
      alt: "An example Guide page showing the title, steps, and icons for each 
        step's external link, image, and details link.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review.png"),
      alt: "A Guide's Review section is shown near the bottom of the page",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_title.png"),
      alt: "A Guide's title is shown above its steps",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Use a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_introduction.png"),
      alt: "If a Guide has introductory information, it's shown below the title 
        and above the steps",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_steps.png"),
      alt: "A Guide's steps are shown below its title (and introduction if any)",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_icons.png"),
      alt: "The  ,  , and  icons and checkbox are shown before each step's 
        number and full text",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Use a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_icons_active_nonactive.png"),
      alt: "Bright orange icons are clickable, dull teal icons are non-clickable 
        placeholders.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_external_link.png"),
      alt: "Orange   icons open a relevant external links in a new browser tab",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_image.png"),
      alt: "Image pop-ups show in the center of the screen and darken the rest of 
        the page",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_details_link.png"),
      alt: "Orange   icons are just links to other guides in Coluguide",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_checkbox.png"),
      alt: "Marking checkboxes feels good and can help keep us organized",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_section.png"),
      alt: "A Guide's Review section, shown near the bottom of the page shows
        only the Review Status Indicator and the orange 󰷊 icon when a page is
        first loaded",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_rsi.png"),
      alt: "The Review Status Indicator next to the orange 󰷊 icon shows the
        Guide's Review Status",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_needs_review.png"),
      alt: "The small Review Section outlined in orange, indicating that the
        Guide needs review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_full_review_section.png"),
      alt: "The orange 󰷊 icon next to the Review Status Indicator can be
        clicked to open the full Review section",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_button.png"),
      alt: "Clicking the Review button brings up an alert notification at the
        top of the screen. Clicking OK on this notification to confirm that
        you've reviewed the Guide will record your review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_rsi_unreviewed.png"),
      alt: "The Review Status Indicator shows a • when you have not reviewed
        the Guide and it is not assigned to you for review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_rsi_reviewed.png"),
      alt: "The Review Status Indicator shows a ✓ when your review of the
        Guide is up-to-date",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_rsi_review_stale.png"),
      alt: "The Review Status Indicator shows an  when the Guide has been
        updated since your last review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_rsi_needs_review.png"),
      alt: "The Review Status Indicator shows an  and the Review Status
        Indicator is outlined in orange when the Guide needs your review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_status_unreviewed.png"),
      alt: "The Review Status is Unreviewed when you have not reviewed the
        Guide and it is not assigned to you for review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_status_reviewed.png"),
      alt: "The Review Status is Reviewed when you have reviewed the Guide
        and it has not been updated since then",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_status_review_stale.png"),
      alt: "The Review Status is Review Stale when you are not assigned to
        review the Guide, but have reviewed it, and it has been updated since
        your last review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_status_needs_review.png"),
      alt: "The Review Status is Needs Review! when you are assigned to review
        the Guide, but have not reviewed it since its last update",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_full_review_section.png"),
      alt: "The orange 󰷊 icon next to the Review Status Indicator can be
        clicked to show or hide the full Review section",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_section_status.png"),
      alt: "The Review Status state is displayed underneath the Review Status
        Indicator and the orange 󰷊 icon",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_section_last_reviewed.png"),
      alt: "The date you last reviewed the Guide is shown below the Review
        Status state",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_section_last_updated.png"),
      alt: "The date the Guide was last updated is shown below the date you
        last reviewed the Guide",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_review_button.png"),
      alt: "Clicking the Review button brings up an alert notification at the
        top of the screen. Clicking OK on this notification to confirm that
        you've reviewed the Guide will record your review",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("guide_needs_review.png"),
      alt: "The Review Status Indicator at the top of the Review section
        is outlined in orange when the Review Status is Needs Review!",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(7, "Use a Guide's Full Review Section")
    })

    # Use Coluguide - Details Links

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand the Coluguide Philosophy")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Review a Guide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("View your Review Statistics")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Guide Reviews in Coluguide")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Use Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Create, Update, and Delete Guides")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Understand the Coluguide Philosophy"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Everything is simple")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Understand the Coluguide Philosophy"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Get the right information quickly")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Understand the Coluguide Philosophy"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Avoid distractions")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Understand the Coluguide Philosophy"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Don't think too hard")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Understand the Coluguide Philosophy"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Good information changes"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Use a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Step Icons")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Review a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Review a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use a Guide's Full Review Section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Read a Guide's Review Status Indicator"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use a Guide's Full Review Section"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Read a Guide's Review Status Indicator")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use a Guide's Full Review Section"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "View your Review Statistics"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Manage Guide Reviews in Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Understand a Guide's Review Status State")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Create, Update, and Delete Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Create, Update, and Delete Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use Editor Mode")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Use Editor Mode"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Use Editor Mode"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Use Editor Mode"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Guides"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Edit Chapters"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Edit Chapters"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Edit Chapters"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Chapter"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Edit Chapters"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Chapter"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Edit Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Edit Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Edit Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Edit Guides"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Add a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Add a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Add a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Add a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Update a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Update a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Delete a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Delete a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Delete a Chapter"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit Chapters"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Add a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Open the New Guide screen"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Add a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Add a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(7, "Add a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Open the New Guide screen"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Chapter"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Open the New Guide screen"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Open the New Guide screen"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Open the New Guide screen"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Guide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Update a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Update a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make titles and names in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Update a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Add a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Update a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Delete a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Delete a Guide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Delete a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Add a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Add a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Update a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Update a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's External Link"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Update a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Image"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(7, "Update a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Edit a Step's Details Link"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Delete a Step"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Enter Editor Mode"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Edit a Step's External Link"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Edit a Step's Image"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(7, "Edit a Step's Image"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Manage Images in Coluguide"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Manage Images in Coluguide"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Use the CRUD section"),
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Edit a Step's Details Link"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Update a Step"),
    })

    # Play a game of Chess - Images

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_setup.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_checkmated.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_checkmate.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_pawn_move.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_pawn_capture.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_en_passant.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_move_no_check.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_capture_no_check.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_pawn_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_rook_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_knight_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_bishop_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_queen_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_king_moves.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_check.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_castling.webp"
    })

    Coluguide.Repo.insert!(%Coluguide.Images.Image{
      src: "chess_pawn_promotion.webp"
    })

    # Play a game of Chess - Chapters

    Coluguide.Repo.insert!(%Coluguide.Chapters.Chapter{
      title: "Play a game of Chess"
    })

    # Play a game of Chess - Guides

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Play a game of Chess",
      name: "Play a game of Chess",
      icon: " ",
      template_id: Coluguide.Guides.get_template_id_by_name!("chapter"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Set up the game",
      name: "Set up a game of Chess",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Take turns",
      name: "Take turns in Chess",
      introduction: "Each player takes turns moving their pieces in one of the 
        following ways:",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Move a piece to an empty space",
      name: "Move a piece to an empty space in Chess",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Capture an opponent's piece",
      name: "Capture an opponent's piece in Chess",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Make a special move",
      name: "Make a special move in Chess",
      introduction: "Choose from one of the following special moves (if their 
        conditions are met):",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Guides.Guide{
      title: "Make a regular move",
      name: "Make a regular move in Chess",
      introduction: "Each piece has regular moves it can make. Choose from the 
        following pieces to see its regular moves:",
      template_id: Coluguide.Guides.get_template_id_by_name!("standard"),
      chapter_id: Coluguide.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    # Play a game of Chess - Steps

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Set up the game",
      external_link: "https://en.wikipedia.org/wiki/Chess#Setup",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Each player takes turns moving their pieces",
      external_link: "https://en.wikipedia.org/wiki/Chess#Movement",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Avoid letting your King be checkmated (otherwise you lose)",
      external_link: "https://en.wikipedia.org/wiki/Checkmate",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Checkmate your opponent's King to win",
      external_link: "https://en.wikipedia.org/wiki/Checkmate",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Thank your opponent and clean up the game",
      external_link: "https://www.il-chess.org/sportsmanship-and-etiquette",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Find an opponent to play with",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Set up the board",
      external_link: "https://en.wikipedia.org/wiki/Rules_of_chess#Initial_setup",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Choose who will play as which color",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "The player playing White goes first",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Move to an empty space",
      external_link: "https://en.wikipedia.org/wiki/Rules_of_chess#Basic_moves",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Capture an opponent's piece",
      external_link: "https://en.wikipedia.org/wiki/Glossary_of_chess#capturing",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Make a special move",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Don't make a move if it would put your King in check!",
      external_link: "https://en.wikipedia.org/wiki/Check_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Move one of your pieces in the regular way",
      external_link: "https://en.wikipedia.org/wiki/Rules_of_chess#Basic_moves",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Capturing a piece means removing it from play",
      external_link: "https://en.wikipedia.org/wiki/Glossary_of_chess#capturing",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Don't make a move if it would put your King in check!",
      external_link: "https://en.wikipedia.org/wiki/Check_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Move one of your pieces onto a space occupied by an opponent's
        piece to capture it",
      external_link: "https://en.wikipedia.org/wiki/Glossary_of_chess#capturing",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Check",
      external_link: "https://en.wikipedia.org/wiki/Check_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Checkmate",
      external_link: "https://en.wikipedia.org/wiki/Checkmate",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "En passant",
      external_link: "https://en.wikipedia.org/wiki/En_passant",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Castling",
      external_link: "https://en.wikipedia.org/wiki/Castling",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Pawn Promotion",
      external_link: "https://en.wikipedia.org/wiki/Promotion_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Pawns move forward one (or sometimes two) spaces to an empty 
        space, or capture diagonally forward",
      external_link: "https://en.wikipedia.org/wiki/Pawn_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 1
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Rooks move horizontally or vertically any number of spaces",
      external_link: "https://en.wikipedia.org/wiki/Rook_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 2
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Knights move in an L-shape",
      external_link: "https://en.wikipedia.org/wiki/Knight_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 3
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Bishops move diagonally any number of spaces",
      external_link: "https://en.wikipedia.org/wiki/Bishop_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 4
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Queens move horizontally, vertically, or diagonally any number 
        of spaces",
      external_link: "https://en.wikipedia.org/wiki/Queen_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 5
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.Step{
      full_text: "Kings move one space in any direction",
      external_link: "https://en.wikipedia.org/wiki/King_(chess)",
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 6
    })

    # Play a game of Chess - Step Images

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_setup.webp"),
      alt: "A game of chess begins with each players' pieces set up on the two 
        rows rows of the board closest to them.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_setup.webp"),
      alt: "A game of chess begins with each players' pieces set up on the two 
        rows rows of the board closest to them.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Set up a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_checkmated.webp"),
      alt: "The White Queen checkmates the Black King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_checkmate.webp"),
      alt: "The Black Rook checkmates the White King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Play a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_move.webp"),
      alt: "Move one of your pieces to an empty space according to its movement
        rules.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Take turns in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_capture.webp"),
      alt: "Capture one of your opponent's pieces by moving one of your pieces onto
        the space it occupies.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Take turns in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_en_passant.webp"),
      alt: "Make a special move if the conditions are met (en passant shown).",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Take turns in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_move_no_check.webp"),
      alt: "Moving this Pawn lets the White Queen check the Black King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Move a piece to an empty space in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_move.webp"),
      alt: "Move one of your pieces to an empty space according to its movement
        rules.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Move a piece to an empty space in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_capture_no_check.webp"),
      alt: "Capture one of your opponent's pieces by moving one of your pieces onto
        the space it occupies.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Capture an opponent's piece in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_capture.webp"),
      alt: "Capture one of your opponent's pieces by moving one of your pieces onto
        the space it occupies.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Capture an opponent's piece in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_moves.webp"),
      alt: "Pawns move forward one (or sometimes two) spaces to an empty space, or 
        capture diagonally forward.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_rook_moves.webp"),
      alt: "Rooks move horizontally or vertically any number of spaces.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_knight_moves.webp"),
      alt: "Knights move in an L-shape in any direction.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_bishop_moves.webp"),
      alt: "Bishops move diagonally any number of spaces.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_queen_moves.webp"),
      alt: "Queens move horizontally, vertically, or diagonally any number of 
        spaces.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_king_moves.webp"),
      alt: "Kings move one space in any direction.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(6, "Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_check.webp"),
      alt: "The Black Knight checks the White King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Make a special move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_checkmate.webp"),
      alt: "The Black Rook checks the White King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Make a special move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_en_passant.webp"),
      alt: "Black castles, moving their King two spaces towards the Rook and their 
        Rook to the other side of their King.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Make a special move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_castling.webp"),
      alt: "As its first move, a Pawn may capture en passant by moving forward two 
        spaces while capturing a piece diagonally adjacent that it moves past.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(4, "Make a special move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.StepImage{
      image_id: Coluguide.Images.get_image_id_by_src!("chess_pawn_promotion.webp"),
      alt: "Moving this Pawn to the end of the board lets it become another piece.",
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(5, "Make a special move in Chess")
    })

    # Play a game of Chess - Details Links

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Play a game of Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Set up a game of Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Play a game of Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Take turns in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(1, "Take turns in Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Take turns in Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Take turns in Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a special move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(2, "Move a piece to an empty space in Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess")
    })

    Coluguide.Repo.insert!(%Coluguide.Steps.DetailsLink{
      step_id: Coluguide.Steps.get_step_id_by_number_and_guide_name!(3, "Capture an opponent's piece in Chess"),
      guide_id: Coluguide.Guides.get_guide_id_by_name!("Make a regular move in Chess")
    })
  end
end
