defmodule Guideme.ReviewRecords.ReviewedGuide do
  @moduledoc """
  Each row represents a review of a Guide by a specific User.

  An admin User can assign Users to review specific Guides. When a Guide is
  updated with changes needing review, Users assigned to review it will be
  notified. This way, an administrator can have feedback that their Users are
  keeping up to date with the current information.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviewed_guides" do
    # The date and time the Guide was last reviewed
    field :reviewed_at, :utc_datetime
    # The User reviewing the guide
    belongs_to :user, Guideme.Users.User
    # The Guide being reviewed
    belongs_to :guide, Guideme.Guides.Guide
    # The admin User who assigned the review
    belongs_to :review_assigned_by, Guideme.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reviewed_guide, attrs) do
    reviewed_guide
    |> cast(attrs, [:reviewed_at, :user_id, :guide_id, :review_assigned_by_id])
    |> validate_required([:reviewed_at, :user_id, :guide_id])
  end
end
