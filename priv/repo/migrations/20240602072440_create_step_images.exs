defmodule Guideme.Repo.Migrations.CreateStepImages do
  use Ecto.Migration

  def change do
    create table(:step_images) do
      add :image_id, references(:images, on_delete: :nothing)
      add :alt, :string
      add :step_id, references(:steps, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:step_images, [:step_id])
  end
end
