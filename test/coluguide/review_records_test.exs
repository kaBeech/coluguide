defmodule Coluguide.ReviewRecordsTest do
  use Coluguide.DataCase

  alias Coluguide.ReviewRecords

  describe "reviewed_guides" do
    alias Coluguide.ReviewRecords.ReviewedGuide

    import Coluguide.ReviewRecordsFixtures

    @invalid_attrs %{reviewed_at: nil}

    test "list_reviewed_guides/0 returns all reviewed_guides" do
      reviewed_guide = reviewed_guide_fixture()
      assert ReviewRecords.list_reviewed_guides() == [reviewed_guide]
    end

    test "get_reviewed_guide!/1 returns the reviewed_guide with given id" do
      reviewed_guide = reviewed_guide_fixture()
      assert ReviewRecords.get_reviewed_guide!(reviewed_guide.id) == reviewed_guide
    end

    test "create_reviewed_guide/1 with valid data creates a reviewed_guide" do
      valid_attrs = %{reviewed_at: ~D[2024-06-01]}

      assert {:ok, %ReviewedGuide{} = reviewed_guide} = ReviewRecords.create_reviewed_guide(valid_attrs)
      assert reviewed_guide.reviewed_at == ~D[2024-06-01]
    end

    test "create_reviewed_guide/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ReviewRecords.create_reviewed_guide(@invalid_attrs)
    end

    test "update_reviewed_guide/2 with valid data updates the reviewed_guide" do
      reviewed_guide = reviewed_guide_fixture()
      update_attrs = %{reviewed_at: ~D[2024-06-02]}

      assert {:ok, %ReviewedGuide{} = reviewed_guide} = ReviewRecords.update_reviewed_guide(reviewed_guide, update_attrs)
      assert reviewed_guide.reviewed_at == ~D[2024-06-02]
    end

    test "update_reviewed_guide/2 with invalid data returns error changeset" do
      reviewed_guide = reviewed_guide_fixture()
      assert {:error, %Ecto.Changeset{}} = ReviewRecords.update_reviewed_guide(reviewed_guide, @invalid_attrs)
      assert reviewed_guide == ReviewRecords.get_reviewed_guide!(reviewed_guide.id)
    end

    test "delete_reviewed_guide/1 deletes the reviewed_guide" do
      reviewed_guide = reviewed_guide_fixture()
      assert {:ok, %ReviewedGuide{}} = ReviewRecords.delete_reviewed_guide(reviewed_guide)
      assert_raise Ecto.NoResultsError, fn -> ReviewRecords.get_reviewed_guide!(reviewed_guide.id) end
    end

    test "change_reviewed_guide/1 returns a reviewed_guide changeset" do
      reviewed_guide = reviewed_guide_fixture()
      assert %Ecto.Changeset{} = ReviewRecords.change_reviewed_guide(reviewed_guide)
    end
  end
end
