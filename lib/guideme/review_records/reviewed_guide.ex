defmodule Guideme.ReviewRecords.ReviewedGuide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviewed_guides" do
    field :reviewed_at, :date
    belongs_to :user, Guideme.Users.User
    has_one :guide, Guideme.Guides.Guide

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reviewed_guide, attrs) do
    reviewed_guide
    |> cast(attrs, [:reviewed_at, :user_id, :guide_id])
    |> validate_required([:reviewed_at, :user_id, :guide_id])
  end
end
