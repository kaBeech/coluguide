defmodule Guideme.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :chapter_id, references(:chapters, on_delete: :nothing)
      add :title, :text
      add :short_title, :string
      add :template_id, references(:templates, on_delete: :nothing)
      add :icon, :string

      timestamps(type: :utc_datetime)
    end

    create index(:guides, [:chapter_id])
    create unique_index(:guides, [:short_title])
  end
end
