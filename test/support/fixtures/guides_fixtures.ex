defmodule Guideme.GuidesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guideme.Guides` context.
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
        short_title: "some short_title",
        title: "some title"
      })
      |> Guideme.Guides.create_guide()

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
      |> Guideme.Guides.create_template()

    template
  end
end
