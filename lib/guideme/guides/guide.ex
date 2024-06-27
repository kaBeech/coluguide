defmodule Guideme.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    field :title, :string
    belongs_to :template, Guideme.Guides.Template
    belongs_to :chapter, Guideme.Chapters.Chapter
    field :name, :string
    field :icon, :string
    field :introduction, :string
    has_many :linked_to_by, Guideme.Steps.Step
    has_many :users_have_reviewed, Guideme.ReviewRecords.ReviewedGuide

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:chapter_id, :title, :name, :template_id, :icon, :introduction])
    |> validate_required([:chapter_id, :title, :name, :template_id])
    |> unique_constraint(:name)
  end
end
