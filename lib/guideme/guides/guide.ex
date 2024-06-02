defmodule Guideme.Guides.Guide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    field :title, :string
    field :category, :string
    field :chapter, :string
    field :short_title, :string
    field :icon, :string
    has_many :steps, Guideme.Guides.Step

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [:chapter, :title, :short_title, :category, :icon])
    |> validate_required([:chapter, :title, :short_title, :category])
  end
end
