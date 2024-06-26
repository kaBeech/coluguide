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

Guideme.Repo.insert!(%Guideme.Guides.Template{
  name: "chapter"
})

Guideme.Repo.insert!(%Guideme.Guides.Template{
  name: "standard"
})

Guideme.Repo.insert!(%Guideme.Images.Image{
  src: "guide_template_standard.png"
})

Guideme.Repo.insert!(%Guideme.Images.Image{
  src: "guide_title.png"
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

Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
  title: "Using GuideMe"
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Using GuideMe",
  short_title: "Using GuideMe",
  icon: "󱃔 ",
  template_id: 1,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Use a Guide",
  short_title: "Use a Guide",
  template_id: 2,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Use a Guide",
  guide_id: 1,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Each Guide's title is shown near the top of the page.",
  guide_id: 2,
  number: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Underneath the title are one or more Steps to follow",
  guide_id: 2,
  number: 2
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Each Step has several associated icons and a checkbox that show 
    before the Step's full text",
  guide_id: 2,
  number: 3
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "The icons are clickable if they're bright orange - dull teal 
    icons are non-clickable placeholders",
  guide_id: 2,
  number: 4
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Clicking an orange   icon will open a relevant external link in 
    a new browser tab",
  guide_id: 2,
  number: 5
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Clicking an orange   icon will pop up a helpful image related to
    the step",
  guide_id: 2,
  number: 6
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Clicking an orange   icon will open another guide which covers 
    the step in more detail",
  guide_id: 2,
  number: 7
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Checkboxes are just there for a bit of pseudo-tactile 
    satisfaction",
  guide_id: 2,
  number: 8
})

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
  alt: "A Guide's steps are shown above its title",
  step_id: 3
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 4,
  alt: "The  ,  , and  icons and checkbox are shown before each step's 
    number and full text",
  step_id: 4
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 5,
  alt: "Bright orange icons are clickable, dull teal icons are non-clickable 
    placeholders.",
  step_id: 5
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 6,
  alt: "Orange   icons open a relevant external links in a new browser tab",
  step_id: 6
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 7,
  alt: "Image pop-ups show in the center of the screen and darken the rest of 
    the page",
  step_id: 7
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 8,
  alt: "Orange   icons are just links to other guides in GuideMe",
  step_id: 8
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 9,
  alt: "Marking checkboxes feels good and can help keep us organized",
  step_id: 9
})

Guideme.Repo.insert!(%Guideme.Steps.DetailsLink{
  step_id: 1,
  guide_id: 2
})
