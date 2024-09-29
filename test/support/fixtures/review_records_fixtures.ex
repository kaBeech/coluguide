defmodule GuideMe.ReviewRecordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GuideMe.ReviewRecords` context.
  """

  @doc """
  Generate a reviewed_guide.
  """
  def reviewed_guide_fixture(attrs \\ %{}) do
    {:ok, reviewed_guide} =
      attrs
      |> Enum.into(%{
        reviewed_at: ~D[2024-06-01]
      })
      |> GuideMe.ReviewRecords.create_reviewed_guide()

    reviewed_guide
  end
end
