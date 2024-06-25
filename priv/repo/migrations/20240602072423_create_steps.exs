defmodule Guideme.Repo.Migrations.CreateSteps do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :full_text, :text
      add :number, :integer
      add :external_link, :string
      add :guide_id, references(:guides, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:steps, [:guide_id])
  end
end
