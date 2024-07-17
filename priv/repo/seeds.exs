# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Guideme.Repo.insert!(%Guideme.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Core data
Guideme.Repo.insert!(%Guideme.Guides.Template{
  name: "chapter"
})

Guideme.Repo.insert!(%Guideme.Guides.Template{
  name: "standard"
})

# Using GuideMe - Images
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

# Using GuideMe - Chapters
Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
  title: "Using GuideMe"
})

# Using GuideMe - Guides
Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Using GuideMe",
  name: "Using GuideMe",
  icon: "󱃔 ",
  template_id: 1,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Use a Guide",
  name: "Use a Guide",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Create a Guide",
  name: "Create a Guide",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "View Guides",
  name: "View Guides",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Edit a Guide",
  name: "Edit a Guide",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Delete a Guide",
  name: "Delete a Guide",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Use Step Icons",
  name: "Use Step Icons",
  template_id: 2,
  chapter_id: 1
})

# Using GuideMe - Steps
Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Use a Guide",
  guide_id: 1,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Each Guide's title is shown near the top of the page",
  guide_id: 2,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Some Guides have introductory information before the Steps 
    begin",
  guide_id: 2,
  number: 2
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Follow the steps underneath the title",
  guide_id: 2,
  number: 3
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Use the Step Icons to interact with the Guide",
  guide_id: 2,
  number: 4
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Step icons are clickable if they're bright orange - dull teal 
    icons are non-clickable placeholders",
  guide_id: 3,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  external_link: "https://www.wikipedia.org/",
  full_text: "Clicking an orange   icon will open a relevant external link in 
    a new browser tab",
  guide_id: 3,
  number: 2
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Clicking an orange   icon will pop up a helpful image related to
    the step",
  guide_id: 3,
  number: 3
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Clicking an orange   icon will open another guide which covers 
    the step in more detail",
  guide_id: 3,
  number: 4
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Checkboxes are just there for a bit of pseudo-tactile 
    satisfaction",
  guide_id: 3,
  number: 5
})

# Using GuideMe - Step Images
Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 1,
  alt: "An example Guide page showing the title, steps, and icons for each 
    step's external link, image, and details link.",
  step_id: 1
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 2,
  alt: "A Guide's title is shown above its steps",
  step_id: 2
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 3,
  alt: "If a Guide has introductory information, it's shown below the title 
    and above the steps",
  step_id: 3
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 4,
  alt: "A Guide's steps are shown below its title (and introduction if any)",
  step_id: 4
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 5,
  alt: "The  ,  , and  icons and checkbox are shown before each step's 
    number and full text",
  step_id: 5
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 6,
  alt: "Bright orange icons are clickable, dull teal icons are non-clickable 
    placeholders.",
  step_id: 6
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 7,
  alt: "Orange   icons open a relevant external links in a new browser tab",
  step_id: 7
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 8,
  alt: "Image pop-ups show in the center of the screen and darken the rest of 
    the page",
  step_id: 8
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 9,
  alt: "Orange   icons are just links to other guides in GuideMe",
  step_id: 9
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 10,
  alt: "Marking checkboxes feels good and can help keep us organized",
  step_id: 10
})

# Using GuideMe - Details Links
Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
  step_id: 1,
  guide_id: 2
})

Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
  step_id: 5,
  guide_id: 3
})

# Winning Chess - Images

# Winning Chess - Chapters
Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
  title: "Winning Chess"
})

# Winning Chess - Guides
Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Winning Chess",
  name: "Winning Chess",
  icon: " ",
  template_id: 1,
  chapter_id: 2
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Set up a game of Chess",
  name: "Set up a game of Chess",
  template_id: 2,
  chapter_id: 2
})

# Winning Chess - Steps
Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Set up the game",
  guide_id: 4,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Each player takes turns moving their pieces",
  guide_id: 4,
  number: 2
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Avoid letting your King be checkmated (otherwise you lose)",
  guide_id: 4,
  number: 3
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Checkmate your opponent's King to win",
  guide_id: 4,
  number: 4
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Thank your opponent and clean up the game",
  guide_id: 4,
  number: 5
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Find an opponent to play with",
  guide_id: 5,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Set up the board",
  guide_id: 5,
  number: 2
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Choose who will play as which color",
  guide_id: 5,
  number: 3
})

# Winning Chess - Step Images

# Winning Chess - Details Links
