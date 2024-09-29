defmodule GuideMe.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end

    create(unique_index(:templates, [:name]))
  end
end
