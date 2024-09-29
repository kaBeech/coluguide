defmodule GuideMe.ChaptersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GuideMe.Chapters` context.
  """

  @doc """
  Generate a chapter.
  """
  def chapter_fixture(attrs \\ %{}) do
    {:ok, chapter} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> GuideMe.Chapters.create_chapter()

    chapter
  end
end
