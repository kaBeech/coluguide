defmodule Coluguide.GuidesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coluguide.Guides` context.
  """

  @doc """
  Generate a guide.
  """
  def guide_fixture(attrs \\ %{}) do
    {:ok, guide} =
      attrs
      |> Enum.into(%{
        template: "some template",
        chapter: "some chapter",
        icon: "some icon",
        name: "some name",
        title: "some title"
      })
      |> Coluguide.Guides.create_guide()

    guide
  end

  @doc """
  Generate a template.
  """
  def template_fixture(attrs \\ %{}) do
    {:ok, template} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Coluguide.Guides.create_template()

    template
  end
end
