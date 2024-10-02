defmodule Coluguide.Users.UserTest do
  use Coluguide.DataCase

  alias Coluguide.Users.User

  test "changeset/2 sets default role" do
    user =
      %User{}
      |> User.changeset(%{})
      |> Ecto.Changeset.apply_changes()

    assert user.role == "user"
  end

  test "changeset_role/2" do
    changeset = User.changeset_role(%User{}, %{role: "invalid"})

    assert changeset.errors[:role] ==
             {"is invalid", [validation: :inclusion, enum: ["user", "editor", "admin"]]}

    changeset = User.changeset_role(%User{}, %{role: "admin"})
    refute changeset.errors[:role]

    changeset = User.changeset_role(%User{}, %{role: "editor"})
    refute changeset.errors[:role]

    changeset = User.changeset_role(%User{}, %{role: "user"})
    refute changeset.errors[:role]
  end
end
