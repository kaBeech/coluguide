defmodule Coluguide.UserIdentities.UserIdentity do
  use Ecto.Schema
  use PowAssent.Ecto.UserIdentities.Schema, user: Coluguide.Users.User

  schema "user_identities" do
    pow_assent_user_identity_fields()

    timestamps()
  end
end
