defmodule Coluguide.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :src, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:images, [:src])
  end
end
