defmodule Coluguide.ChaptersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coluguide.Chapters` context.
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
      |> Coluguide.Chapters.create_chapter()

    chapter
  end
end
