defmodule Guideme.Repo.Migrations.CreateStepImages do
  use Ecto.Migration

  def change do
    create table(:step_images) do
      add :src, :string
      add :alt, :string
      add :step_id, references(:steps, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:step_images, [:step_id])
  end
end
