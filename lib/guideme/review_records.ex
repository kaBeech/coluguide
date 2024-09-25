defmodule Guideme.ReviewRecords do
  @moduledoc """
  The ReviewRecords context.
  """

  import Ecto.Query, warn: false
  alias Guideme.Repo

  alias Guideme.ReviewRecords.ReviewedGuide

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
  def create_reviewed_guide(user, attrs \\ %{}) do
    user
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
