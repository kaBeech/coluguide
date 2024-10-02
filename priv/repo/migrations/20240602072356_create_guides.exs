defmodule Coluguide.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :chapter_id, references(:chapters, on_delete: :nothing)
      add :title, :text
      add :name, :string
      add :template_id, references(:templates, on_delete: :nothing)
      add :icon, :string
      add :introduction, :text
      add :updated_for_review_at, :utc_datetime
      add :last_updated_by_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:guides, [:chapter_id])
    create index(:guides, [:template_id])
    create index(:guides, [:last_updated_by_id])
    create unique_index(:guides, [:name])

    create index(:guides, [:chapter_id],
             include: [:name, :template_id],
             name: :guide_directory_covering_index
           )

    create index(:guides, [:template_id],
             include: [:name, :icon],
             name: :chapter_selection_covering_index
           )

    create index(:guides, [:id],
             include: [:name, :updated_for_review_at, :inserted_at],
             name: :list_guides_for_my_reviews_covering_index
           )
  end
end
