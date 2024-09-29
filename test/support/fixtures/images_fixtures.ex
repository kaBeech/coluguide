defmodule GuideMe.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GuideMe.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        src: "some src"
      })
      |> GuideMe.Images.create_image()

    image
  end
end
