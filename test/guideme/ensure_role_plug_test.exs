defmodule GuideMeWeb.EnsureRolePlugTest do
  use GuideMeWeb.ConnCase

  alias GuideMeWeb.EnsureRolePlug

  @opts ~w(admin)a
  @opts ~w(editor)a
  @user %{id: 1, role: "user"}
  @admin %{id: 2, role: "admin"}
  @editor %{id: 3, role: "editor"}

  setup do
    conn =
      build_conn()
      |> Plug.Conn.put_private(:plug_session, %{})
      |> Plug.Conn.put_private(:plug_session_fetch, :done)
      |> Pow.Plug.put_config(otp_app: :guideme)
      |> fetch_flash()

    {:ok, conn: conn}
  end

  test "call/2 with no user", %{conn: conn} do
    opts = EnsureRolePlug.init(@opts)
    conn = EnsureRolePlug.call(conn, opts)

    assert conn.halted
    assert redirected_to(conn) == ~p"/"
  end

  test "call/2 with non-admin user", %{conn: conn} do
    opts = EnsureRolePlug.init(@opts)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@user, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    assert conn.halted
    assert redirected_to(conn) == ~p"/"
  end

  test "call/2 with non-admin user and multiple roles", %{conn: conn} do
    opts = EnsureRolePlug.init(~w(user admin)a)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@user, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    refute conn.halted
  end

  test "call/2 with admin user", %{conn: conn} do
    opts = EnsureRolePlug.init(@opts)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@admin, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    refute conn.halted
  end

  test "call/2 with non-editor user", %{conn: conn} do
    opts = EnsureRolePlug.init(@opts)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@user, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    assert conn.halted
    assert redirected_to(conn) == ~p"/"
  end

  test "call/2 with non-editor user and multiple roles", %{conn: conn} do
    opts = EnsureRolePlug.init(~w(user editor)a)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@user, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    refute conn.halted
  end

  test "call/2 with editor user", %{conn: conn} do
    opts = EnsureRolePlug.init(@opts)

    conn =
      conn
      |> Pow.Plug.assign_current_user(@editor, otp_app: :guideme)
      |> EnsureRolePlug.call(opts)

    assert conn.halted
    assert redirected_to(conn) == ~p"/"
  end
end
