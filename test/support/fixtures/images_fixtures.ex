defmodule Coluguide.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coluguide.Images` context.
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
      |> Coluguide.Images.create_image()

    image
  end
end
