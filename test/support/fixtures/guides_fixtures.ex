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
        category: "some category",
        chapter: "some chapter",
        icon: "some icon",
        short_title: "some short_title",
        title: "some title"
      })
      |> Guideme.Guides.create_guide()

    guide
  end
end
