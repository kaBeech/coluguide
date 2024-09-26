defmodule GuidemeWeb.SeedLive do
  @moduledoc """
  This is a hacky workaround to seed the database without using Mix.
  """
  use GuidemeWeb, :live_view

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
    Guideme.Repo.insert!(%Guideme.Guides.Template{
      name: "chapter"
    })

    Guideme.Repo.insert!(%Guideme.Guides.Template{
      name: "standard"
    })

    # Use GuideMe - Images
    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_template_standard.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_title.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_introduction.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_steps.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_icons.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_icons_active_nonactive.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_external_link.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_image.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_details_link.png"
    })

    Guideme.Repo.insert!(%Guideme.Images.Image{
      src: "guide_checkbox.png"
    })

    # Use GuideMe - Chapters
    Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
      title: "Use GuideMe"
    })

    # Use GuideMe - Guides
    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Use GuideMe",
      name: "Use GuideMe",
      icon: "󱃔 ",
      template_id: Guideme.Guides.get_template_id_by_name!("chapter"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Use GuideMe")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Use a Guide",
      name: "Use a Guide",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Use GuideMe")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Use Step Icons",
      name: "Use Step Icons",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Use GuideMe")
    })

    # Use GuideMe - Steps
    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Use a Guide",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use GuideMe"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Review Guides that have been assigned to you",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use GuideMe"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "See which updated Guides need to be reviewed again",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use GuideMe"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Assign Guides to Users for review",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use GuideMe"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Create, update, and delete Guides",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use GuideMe"),
      number: 5
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Each Guide's title is shown near the top of the page",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Some Guides have introductory information before the Steps 
        begin",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Follow the steps underneath the title",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Use the Step Icons to interact with the Guide",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use a Guide"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Step icons are clickable if they're bright orange - dull teal 
        icons are non-clickable placeholders",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      external_link: "https://www.wikipedia.org/",
      full_text: "Clicking an orange   icon will open a relevant external link in 
        a new browser tab",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Clicking an orange   icon will pop up a helpful image related to
        the step",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Clicking an orange   icon will open another guide which covers 
        the step in more detail",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Checkboxes are just there for a bit of pseudo-tactile 
        satisfaction",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons"),
      number: 5
    })

    # Use GuideMe - Step Images
    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 1,
      alt: "An example Guide page showing the title, steps, and icons for each 
        step's external link, image, and details link.",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Use GuideMe")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 2,
      alt: "A Guide's title is shown above its steps",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Use a Guide")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 3,
      alt: "If a Guide has introductory information, it's shown below the title 
        and above the steps",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(2, "Use a Guide")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 4,
      alt: "A Guide's steps are shown below its title (and introduction if any)",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(3, "Use a Guide")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 5,
      alt: "The  ,  , and  icons and checkbox are shown before each step's 
        number and full text",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(4, "Use a Guide")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 6,
      alt: "Bright orange icons are clickable, dull teal icons are non-clickable 
        placeholders.",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Use Step Icons")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 7,
      alt: "Orange   icons open a relevant external links in a new browser tab",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(2, "Use Step Icons")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 8,
      alt: "Image pop-ups show in the center of the screen and darken the rest of 
        the page",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(3, "Use Step Icons")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 9,
      alt: "Orange   icons are just links to other guides in GuideMe",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(4, "Use Step Icons")
    })

    Guideme.Repo.insert!(%Guideme.Steps.StepImage{
      image_id: 10,
      alt: "Marking checkboxes feels good and can help keep us organized",
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(5, "Use Step Icons")
    })

    # Use GuideMe - Details Links
    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Use GuideMe"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use a Guide")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(4, "Use a Guide"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Use Step Icons")
    })

    # Play a game of Chess - Images

    # Play a game of Chess - Chapters
    Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
      title: "Play a game of Chess"
    })

    # Play a game of Chess - Guides
    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Play a game of Chess",
      name: "Play a game of Chess",
      icon: " ",
      template_id: Guideme.Guides.get_template_id_by_name!("chapter"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Set up the game",
      name: "Set up a game of Chess",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Take turns",
      name: "Take turns in Chess",
      introduction: "Each player takes turns moving their pieces in one of the 
        following ways:",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Move a piece to an empty space",
      name: "Move a piece to an empty space in Chess",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Capture an opponent's piece",
      name: "Capture an opponent's piece in Chess",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Make a special move",
      name: "Make a special move in Chess",
      introduction: "Choose from one of the following special moves (if their 
        conditions are met):",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Guides.Guide{
      title: "Make a regular move",
      name: "Make a regular move in Chess",
      introduction: "Each piece has regular moves it can make. Choose from the 
        following pieces to see its regular moves:",
      template_id: Guideme.Guides.get_template_id_by_name!("standard"),
      chapter_id: Guideme.Chapters.get_chapter_id_by_title!("Play a game of Chess")
    })

    # Play a game of Chess - Steps
    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Set up the game",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Each player takes turns moving their pieces",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Avoid letting your King be checkmated (otherwise you lose)",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Checkmate your opponent's King to win",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Thank your opponent and clean up the game",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Play a game of Chess"),
      number: 5
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Find an opponent to play with",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Set up the board",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Choose who will play as which color",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "The player playing White goes first",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Set up a game of Chess"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Move to an empty space",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Capture an opponent's piece",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Make a special move",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Take turns in Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Don't make a move if it would checkmate your King!",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Move one of your pieces in the regular way",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Capturing a piece means removing it from play",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Don't make a move if it would checkmate your King!",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Move one of your pieces in its regular way onto a space 
        occupied by an opponent's piece to capture it",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Check",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Checkmate",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "En passant",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Castling",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Pawn Promotion",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess"),
      number: 5
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Pawns move forward one (or sometimes two) spaces to an empty 
        space, or capture diagonally forward",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 1
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Rooks move horizontally or vertically any number of spaces",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 2
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Knights move in an L-shape",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 3
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Bishops move diagonally any number of spaces",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 4
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Queens move horizontally, vertically, or diagonally any number 
        of spaces",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 5
    })

    Guideme.Repo.insert!(%Guideme.Steps.Step{
      full_text: "Kings move one space in any direction",
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess"),
      number: 6
    })

    # Play a game of Chess - Step Images

    # Play a game of Chess - Details Links
    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Play a game of Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Set up a game of Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(2, "Play a game of Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Take turns in Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(1, "Take turns in Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Move a piece to an empty space in Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(2, "Take turns in Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Capture an opponent's piece in Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(3, "Take turns in Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a special move in Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(2, "Move a piece to an empty space in Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess")
    })

    Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
      step_id: Guideme.Steps.get_step_id_by_number_and_guide_name!(3, "Capture an opponent's piece in Chess"),
      guide_id: Guideme.Guides.get_guide_id_by_name!("Make a regular move in Chess")
    })
  end
end
