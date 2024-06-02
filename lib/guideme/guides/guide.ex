defmodule Guideme.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    field :title, :string
    field :category, :string
    field :chapter, :string
    field :short_title, :string
    field :icon, :string
    has_many :linked_to_by, Guideme.Steps.Step
    has_many :users_have_reviewed, Guideme.ReviewRecords.ReviewedGuide

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:chapter, :title, :short_title, :category, :icon])
    |> validate_required([:chapter, :title, :short_title, :category])
  end
end
