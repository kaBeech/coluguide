defmodule Guideme.Guides.Guide do
  @moduledoc """
  A Guide is a simple, declarative explanation of how to perform a task or
  description of a concept.

  Guides include a title, potentially some introductory text, and a series of
  Steps.

  Guides are organized into Chapters. Each Guide belongs to exactly one
  Chapter, even if it is referenced within multiple Chapters.

  Guides may be reviewed by Users, and Admin Users may assign Users to review
  specific Guides. When a Guide is updated will changes needing review, Users
  assigned to review it will be notified.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "guides" do
    field :title, :string
    # Template to be used when displaying the Guide. Examples are "chapter" for
    # the index page of a chapter, which adds the tutorial at the top of the
    # page, or "standard" for most Guides, which omits the tutorial.
    belongs_to :template, Guideme.Guides.Template
    belongs_to :chapter, Guideme.Chapters.Chapter
    # Name of the Guide useful for disambiguating Guides between different
    # Chapters. For example, a Guide within a Chapter about playing chess's
    # Title may be "Move a Piece to an Empty Space" while its Name is "Move a
    # Piece to an Empty Space in Chess".
    field :name, :string
    field :icon, :string
    # Optional introductory text
    field :introduction, :string
    # When the Guide was last updated for review. When a Guide is updated, the
    # User making the change may specify whether or not their update should
    # trigger a requirement for Users assigned to review this Guide to review
    # it again. If they choose to trigger a review, this field will be set to
    # the current time.
    field :updated_for_review_at, :utc_datetime
    has_many :steps, Guideme.Steps.Step
    # Steps (in other Guides) which link to this Guide.
    has_many :linked_to_by, Guideme.Steps.Step
    has_many :user_reviews, Guideme.ReviewRecords.ReviewedGuide
    # The User who most recently updated this Guide. In the future, when a User
    # creates, updates, or deletes a Guide (or subsidiary data like Steps), an
    # entry in the (currently non-existent) ChangeHistory table will be created
    # with this User, a timestamp, and an EctoDiff with the details of the
    # changes.
    has_one :last_updated_by, Guideme.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guide, attrs) do
    guide
    |> cast(attrs, [
      :chapter_id,
      :title,
      :name,
      :template_id,
      :icon,
      :introduction,
      :updated_for_review_at,
      :last_updated_by_id
    ])
    |> validate_required([:chapter_id, :title, :name, :template_id])
    |> unique_constraint(:name)
  end
end
