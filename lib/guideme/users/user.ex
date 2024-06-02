defmodule Guideme.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowEmailConfirmation]

  schema "users" do
    field :role, :string, default: "user"
    has_many :reviewed_guides, Guideme.ReviewRecords.ReviewedGuide

    pow_user_fields()

    timestamps()
  end

  @spec changeset_role(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user editor admin))
  end

  @spec changeset_reviewed_guides(Ecto.Schema.t() | Ecto.Changeset.t(), map()) ::
          Ecto.Changeset.t()
  def changeset_reviewed_guides(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:reviewed_guide_ids])
    |> Ecto.Changeset.validate_required([:reviewed_guide_ids])
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
  end
end
