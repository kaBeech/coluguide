defmodule Coluguide.Repo.Migrations.CreateDetailsLinks do
  use Ecto.Migration

  def change do
    create table(:details_links) do
      add :step_id, references(:steps, on_delete: :delete_all)
      add :guide_id, references(:guides, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:details_links, [:step_id])
    create index(:details_links, [:guide_id])
  end
end
