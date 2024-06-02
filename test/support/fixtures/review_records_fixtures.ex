defmodule Guideme.ReviewRecordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guideme.ReviewRecords` context.
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
      |> Guideme.ReviewRecords.create_reviewed_guide()

    reviewed_guide
  end
end
