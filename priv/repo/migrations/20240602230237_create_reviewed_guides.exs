defmodule Guideme.Repo.Migrations.CreateReviewedGuides do
  use Ecto.Migration

  def change do
    create table(:reviewed_guides) do
      add :reviewed_at, :utc_datetime
      add :user_id, references(:users, on_delete: :delete_all)
      add :guide_id, references(:guides, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:reviewed_guides, [:user_id])
    create index(:reviewed_guides, [:guide_id])
    create unique_index(:reviewed_guides, [:guide_id, :user_id])
  end
end
