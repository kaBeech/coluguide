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
  src: "icon.svg"
})

Guideme.Repo.insert!(%Guideme.Chapters.Chapter{
  title: "Test Chapter"
})

Guideme.Repo.insert!(%Guideme.Guides.Guide{
  title: "Test Guide",
  short_title: "Test Guide",
  template_id: 1,
  chapter_id: 1
})

Guideme.Repo.insert!(%Guideme.Steps.Step{
  full_text: "Test Step 1",
  guide_id: 1,
  number: 1,
  external_link: "https://hexdocs.pm/"
})

Guideme.Repo.insert!(%Guideme.Steps.StepImage{
  image_id: 1,
  alt: "Test Image for Step 1",
  step_id: 1
})

Guideme.Repo.insert!(%Guideme.DetailsLinks.DetailsLink{
  step_id: 1,
  guide_id: 1
})
