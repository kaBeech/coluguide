defmodule Guideme.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end

    create(
      unique_index(
        :chapters,
        [:title]
      )
    )
  end
end
