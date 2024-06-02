defmodule Guideme.Repo.Migrations.CreateReviewedGuides do
  use Ecto.Migration

  def change do
    create table(:reviewed_guides) do
      add :reviewed_at, :date
      add :user_id, references(:users, on_delete: :nothing)
      add :guide_id, references(:guides, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:reviewed_guides, [:user_id])
    create index(:reviewed_guides, [:guide_id])
  end
end
