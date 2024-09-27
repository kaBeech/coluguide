defmodule Guideme.Repo.Migrations.CreateReviewedGuides do
  use Ecto.Migration

  def change do
    create table(:reviewed_guides) do
      add :reviewed_at, :utc_datetime
      add :user_id, references(:users, on_delete: :delete_all)
      add :guide_id, references(:guides, on_delete: :delete_all)
      add :review_assigned_by_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:reviewed_guides, [:user_id])
    create index(:reviewed_guides, [:guide_id])
    create unique_index(:reviewed_guides, [:guide_id, :user_id])

    create index(
             :reviewed_guides,
             [:user_id, :guide_id],
             include: [:review_assigned_by_id, :reviewed_at],
             name: :list_my_reviewed_guides_covering_index
           )
  end
end
