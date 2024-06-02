defmodule Guideme.Repo.Migrations.CreateGuides do
  use Ecto.Migration

  def change do
    create table(:guides) do
      add :chapter, :text
      add :title, :text
      add :short_title, :string
      add :category, :string
      add :icon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
