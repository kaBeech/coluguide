defmodule Guideme.Steps do
  @moduledoc """
  The Steps context.
  """

  import Ecto.Query, warn: false
  alias Guideme.Repo

  alias Guideme.Steps.Step

  @doc """
  Returns the list of steps.

  ## Examples

      iex> list_steps()
      [%Step{}, ...]

  """
  def list_steps do
    Repo.all(Step)
  end

  @doc """
  Gets a single step.

  Raises `Ecto.NoResultsError` if the Step does not exist.

  ## Examples

      iex> get_step!(123)
      %Step{}

      iex> get_step!(456)
      ** (Ecto.NoResultsError)

  """
  def get_step!(id), do: Repo.get!(Step, id)

  @doc """
  Creates a step.

  ## Examples

      iex> create_step(%{field: value})
      {:ok, %Step{}}

      iex> create_step(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_step(guide, attrs \\ %{}) do
    guide
    |> Ecto.build_assoc(:steps)
    |> Step.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a step.

  ## Examples

      iex> update_step(step, %{field: new_value})
      {:ok, %Step{}}

      iex> update_step(step, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_step(%Step{} = step, attrs) do
    step
    |> Step.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a step.

  ## Examples

      iex> delete_step(step)
      {:ok, %Step{}}

      iex> delete_step(step)
      {:error, %Ecto.Changeset{}}

  """
  def delete_step(%Step{} = step) do
    Repo.delete(step)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking step changes.

  ## Examples

      iex> change_step(step)
      %Ecto.Changeset{data: %Step{}}

  """
  def change_step(%Step{} = step, attrs \\ %{}) do
    Step.changeset(step, attrs)
  end

  alias Guideme.Steps.StepImage

  @doc """
  Returns the list of step_images.

  ## Examples

      iex> list_step_images()
      [%StepImage{}, ...]

  """
  def list_step_images do
    Repo.all(StepImage)
  end

  @doc """
  Gets a single step_image.

  Raises `Ecto.NoResultsError` if the Step image does not exist.

  ## Examples

      iex> get_step_image!(123)
      %StepImage{}

      iex> get_step_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_step_image!(id), do: Repo.get!(StepImage, id)

  @doc """
  Creates a step_image.

  ## Examples

      iex> create_step_image(%{field: value})
      {:ok, %StepImage{}}

      iex> create_step_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_step_image(step, attrs \\ %{}) do
    step
    |> Ecto.build_assoc(:step_image)
    |> StepImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a step_image.

  ## Examples

      iex> update_step_image(step_image, %{field: new_value})
      {:ok, %StepImage{}}

      iex> update_step_image(step_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_step_image(%StepImage{} = step_image, attrs) do
    step_image
    |> StepImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a step_image.

  ## Examples

      iex> delete_step_image(step_image)
      {:ok, %StepImage{}}

      iex> delete_step_image(step_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_step_image(%StepImage{} = step_image) do
    Repo.delete(step_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking step_image changes.

  ## Examples

      iex> change_step_image(step_image)
      %Ecto.Changeset{data: %StepImage{}}

  """
  def change_step_image(%StepImage{} = step_image, attrs \\ %{}) do
    StepImage.changeset(step_image, attrs)
  end

  alias Guideme.Steps.DetailsLink

  @doc """
  Returns the list of details_links.

  ## Examples

      iex> list_details_links()
      [%DetailsLink{}, ...]

  """
  def list_details_links do
    Repo.all(DetailsLink)
  end

  @doc """
  Gets a single details_link.

  Raises `Ecto.NoResultsError` if the Details link does not exist.

  ## Examples

      iex> get_details_link!(123)
      %DetailsLink{}

      iex> get_details_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_details_link!(id), do: Repo.get!(DetailsLink, id)

  @doc """
  Creates a details_link.

  ## Examples

      iex> create_details_link(%{field: value})
      {:ok, %DetailsLink{}}

      iex> create_details_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_details_link(step, attrs \\ %{}) do
    step
    |> Ecto.build_assoc(:details_link)
    |> DetailsLink.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a details_link.

  ## Examples

      iex> update_details_link(details_link, %{field: new_value})
      {:ok, %DetailsLink{}}

      iex> update_details_link(details_link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_details_link(%DetailsLink{} = details_link, attrs) do
    details_link
    |> DetailsLink.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a details_link.

  ## Examples

      iex> delete_details_link(details_link)
      {:ok, %DetailsLink{}}

      iex> delete_details_link(details_link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_details_link(%DetailsLink{} = details_link) do
    Repo.delete(details_link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking details_link changes.

  ## Examples

      iex> change_details_link(details_link)
      %Ecto.Changeset{data: %DetailsLink{}}

  """
  def change_details_link(%DetailsLink{} = details_link, attrs \\ %{}) do
    DetailsLink.changeset(details_link, attrs)
  end
end
