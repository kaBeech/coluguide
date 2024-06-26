defmodule Guideme.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    field :title, :string
    has_one :template, Guideme.Guides.Template
    belongs_to :chapter, Guideme.Chapters.Chapter
    field :short_title, :string
    field :icon, :string
    has_many :linked_to_by, Guideme.Steps.Step
    has_many :users_have_reviewed, Guideme.ReviewRecords.ReviewedGuide

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:chapter_id, :title, :short_title, :template_id, :icon])
    |> validate_required([:chapter_id, :title, :short_title, :template_id])
  end
end
