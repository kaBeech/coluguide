defmodule Coluguide.StepsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coluguide.Steps` context.
  """

  @doc """
  Generate a step.
  """
  def step_fixture(attrs \\ %{}) do
    {:ok, step} =
      attrs
      |> Enum.into(%{
        external_link: "some external_link",
        full_text: "some full_text"
      })
      |> Coluguide.Steps.create_step()

    step
  end

  @doc """
  Generate a step_image.
  """
  def step_image_fixture(attrs \\ %{}) do
    {:ok, step_image} =
      attrs
      |> Enum.into(%{
        alt: "some alt",
        src: "some src"
      })
      |> Coluguide.Steps.create_step_image()

    step_image
  end

  @doc """
  Generate a details_link.
  """
  def details_link_fixture(attrs \\ %{}) do
    {:ok, details_link} =
      attrs
      |> Enum.into(%{

      })
      |> Coluguide.Steps.create_details_link()

    details_link
  end
end
