defmodule Coluguide.Guides do
  @moduledoc """
  The Guides context.
  """

  import Ecto.Query, warn: false
  alias Coluguide.Repo

  alias Coluguide.Guides.Guide

  @doc """
  Returns the list of guides.

  ## Examples

      iex> list_guides()
      [%Guide{}, ...]

  """
  def list_guides do
    Repo.all(Guide)
  end

  @doc """
  Returns the list of guides with their names and ids.

  ## Examples

      iex> list_guide_names_and_ids()
      [%{
        id: 1,
        name: "Use Coluguide"
      }, ...]
  """
  def list_guide_names_and_ids do
    Repo.all(
      from(g in Guide,
        select: %{
          id: g.id,
          name: g.name
        }
      )
    )
  end

  @doc """
  Returns all guides that are the Chapter Title for their respective chapters,
  with information necessary for the Chapter Selection view.

  ## Examples

      iex> list_chapter_titles_for_selection()
      [%{
        id: 1,
        name: "Use Coluguide",
        icon: "󱃔"
      }, ...]
  """
  def list_chapter_titles_for_selection do
    Repo.all(
      from(g in Guide,
        where: g.template_id == 1,
        select: %{
          id: g.id,
          name: g.name,
          icon: g.icon
        }
      )
    )
  end

  @doc """
  Returns the list of guides with information necessary for the MyReviews view.

  ## Examples

      iex> list_guides_for_my_reviews()
      [%{
        id: 1,
        name: "Use Coluguide",
        inserted_at: ~U[2021-08-01 00:00:00Z],
        updated_for_review_at: ~U[2021-08-01 00:00:00Z]
      }, ...]
  """
  def list_guides_for_my_reviews do
    Repo.all(
      from(g in Guide,
        select: %{
          id: g.id,
          name: g.name,
          inserted_at: g.inserted_at,
          updated_for_review_at: g.updated_for_review_at
        }
      )
    )
  end

  @doc """
  Gets a single guide.

  Raises `Ecto.NoResultsError` if the Guide does not exist.

  ## Examples

      iex> get_guide!(123)
      %Guide{}

      iex> get_guide!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guide!(id), do: Repo.get!(Guide, id)

  @doc """
  Gets a guide's id by its name.

  Raises `Ecto.NoResultsError` if the Guide does not exist.

  ## Examples

      iex> get_guide_id_by_name!("Use Coluguide")
      1

      iex> get_guide_id_by_name!("nonexistent")
      ** (Ecto.NoResultsError)
  """
  def get_guide_id_by_name!(name) do
    Repo.one!(
      from(g in Guide,
        where: [name: ^name],
        select: g.id
      )
    )
  end

  @doc """
  Creates a guide.

  ## Examples

      iex> create_guide(%{field: value})
      {:ok, %Guide{}}

      iex> create_guide(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guide(chapter, attrs \\ %{}) do
    chapter
    |> Ecto.build_assoc(:guides)
    |> Guide.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a guide.

  ## Examples

      iex> update_guide(guide, %{field: new_value})
      {:ok, %Guide{}}

      iex> update_guide(guide, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guide(%Guide{} = guide, attrs) do
    guide
    |> Guide.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guide.

  ## Examples

      iex> delete_guide(guide)
      {:ok, %Guide{}}

      iex> delete_guide(guide)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guide(%Guide{} = guide) do
    Repo.delete(guide)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guide changes.

  ## Examples

      iex> change_guide(guide)
      %Ecto.Changeset{data: %Guide{}}

  """
  def change_guide(%Guide{} = guide, attrs \\ %{}) do
    Guide.changeset(guide, attrs)
  end

  alias Coluguide.Guides.Template

  @doc """
  Returns the list of templates.

  ## Examples

      iex> list_templates()
      [%Template{}, ...]

  """
  def list_templates do
    Repo.all(Template)
  end

  @doc """
  Gets a single template.

  Raises `Ecto.NoResultsError` if the Template does not exist.

  ## Examples

      iex> get_template!(123)
      %Template{}

      iex> get_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_template!(id), do: Repo.get!(Template, id)

  @doc """
  Gets a template's id by its name.

  Raises `Ecto.NoResultsError` if the Template does not exist.

  ## Examples

      iex> get_template_id_by_name!("chapter")
      1

      iex> get_template_id_by_name!("nonexistent")
      ** (Ecto.NoResultsError)
  """
  def get_template_id_by_name!(name) do
    Repo.one!(
      from(t in Template,
        where: [name: ^name],
        select: t.id
      )
    )
  end

  @doc """
  Creates a template.

  ## Examples

      iex> create_template(%{field: value})
      {:ok, %Template{}}

      iex> create_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_template(attrs \\ %{}) do
    %Template{}
    |> Template.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a template.

  ## Examples

      iex> update_template(template, %{field: new_value})
      {:ok, %Template{}}

      iex> update_template(template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_template(%Template{} = template, attrs) do
    template
    |> Template.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a template.

  ## Examples

      iex> delete_template(template)
      {:ok, %Template{}}

      iex> delete_template(template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_template(%Template{} = template) do
    Repo.delete(template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking template changes.

  ## Examples

      iex> change_template(template)
      %Ecto.Changeset{data: %Template{}}

  """
  def change_template(%Template{} = template, attrs \\ %{}) do
    Template.changeset(template, attrs)
  end
end
