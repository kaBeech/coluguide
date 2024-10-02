defmodule Coluguide.ReviewRecords do
  @moduledoc """
  The ReviewRecords context.
  """

  import Ecto.Query, warn: false
  alias Coluguide.Repo

  alias Coluguide.ReviewRecords.ReviewedGuide

  @doc """
  Returns the list of reviewed_guides.

  ## Examples

      iex> list_reviewed_guides()
      [%ReviewedGuide{}, ...]

  """
  def list_reviewed_guides do
    Repo.all(ReviewedGuide)
  end

  @doc """
  Returns the necessary information on a user's reviewed guides for
  the user's My Reviews page.

  ## Examples

      iex> list_my_reviewed_guides(123)
      [%{
        id: 123,
        reviewed_at: ~U[2021-08-01 00:00:00Z],
        review_assigned_by_id: 456,
        guide_id: 789
      }, ...]
  """
  def list_my_reviewed_guides(user_id) do
    Repo.all(
      from r in ReviewedGuide,
        where: r.user_id == ^user_id,
        select: %{
          id: r.id,
          reviewed_at: r.reviewed_at,
          review_assigned_by_id: r.review_assigned_by_id,
          guide_id: r.guide_id
        }
    )
  end

  @doc """
  Gets a single reviewed_guide.

  Raises `Ecto.NoResultsError` if the Reviewed guide does not exist.

  ## Examples

      iex> get_reviewed_guide!(123)
      %ReviewedGuide{}

      iex> get_reviewed_guide!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reviewed_guide!(id), do: Repo.get!(ReviewedGuide, id)

  @doc """
  Gets a single reviewed_guide by user and guide.

  Returns `nil` if the Reviewed guide does not exist.
  """
  def get_reviewed_guide_by_user_and_guide(user_id, guide_id) do
    Repo.get_by(ReviewedGuide, user_id: user_id, guide_id: guide_id)
  end

  @doc """
  Creates a reviewed_guide.

  ## Examples

      iex> create_reviewed_guide(%{field: value})
      {:ok, %ReviewedGuide{}}

      iex> create_reviewed_guide(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reviewed_guide(guide, attrs \\ %{}) do
    guide
    |> Ecto.build_assoc(:reviewed_guides)
    |> ReviewedGuide.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reviewed_guide.

  ## Examples

      iex> update_reviewed_guide(reviewed_guide, %{field: new_value})
      {:ok, %ReviewedGuide{}}

      iex> update_reviewed_guide(reviewed_guide, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reviewed_guide(%ReviewedGuide{} = reviewed_guide, attrs) do
    reviewed_guide
    |> ReviewedGuide.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reviewed_guide.

  ## Examples

      iex> delete_reviewed_guide(reviewed_guide)
      {:ok, %ReviewedGuide{}}

      iex> delete_reviewed_guide(reviewed_guide)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reviewed_guide(%ReviewedGuide{} = reviewed_guide) do
    Repo.delete(reviewed_guide)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reviewed_guide changes.

  ## Examples

      iex> change_reviewed_guide(reviewed_guide)
      %Ecto.Changeset{data: %ReviewedGuide{}}

  """
  def change_reviewed_guide(%ReviewedGuide{} = reviewed_guide, attrs \\ %{}) do
    ReviewedGuide.changeset(reviewed_guide, attrs)
  end
end
