defmodule Guideme.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :title, :string
      add :title_page_id, references(:guides, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:chapters, [:title_page_id])
  end
end
