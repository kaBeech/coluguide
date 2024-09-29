defmodule GuideMe.UsersTest do
  use GuideMe.DataCase

  alias GuideMe.{Repo, Users, Users.User}

  @valid_params %{
    email: "test@example.com",
    password: "swordfish143",
    password_confirmation: "swordfish143"
  }

  test "create_admin/2" do
    assert {:ok, user} = Users.create_admin(@valid_params)
    assert user.role == "admin"
  end

  test "create_editor/2" do
    assert {:ok, user} = Users.create_editor(@valid_params)
    assert user.role == "editor"
  end

  test "set_admin_role/1" do
    assert {:ok, user} = Repo.insert(User.changeset(%User{}, @valid_params))
    assert user.role == "user"

    assert {:ok, user} = Users.set_admin_role(user)
    assert user.role == "admin"
  end

  test "set_editor_role/1" do
    assert {:ok, user} = Repo.insert(User.changeset(%User{}, @valid_params))
    assert user.role == "user"

    assert {:ok, user} = Users.set_editor_role(user)
    assert user.role == "editor"
  end

  test "set_user_role/1" do
    assert {:ok, user} = Repo.insert(User.changeset(%User{}, @valid_params))
    assert user.role == "user"

    assert {:ok, user} = Users.set_user_role(user)
    assert user.role == "user"
  end
end
