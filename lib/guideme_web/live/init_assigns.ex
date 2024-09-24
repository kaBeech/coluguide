defmodule GuidemeWeb.InitAssigns do
  @moduledoc """
  Ensures common `assigns` are applied to all LiveViews attaching this hook.
  Replace EtsCache with something like Mnesia or Redis for production:
  https://github.com/pow-auth/pow?tab=readme-ov-file#cache-store
  """
  import Phoenix.LiveView
  import Phoenix.Component

  alias Pow.Store.CredentialsCache
  alias Pow.Store.Backend.EtsCache

  def on_mount(:default, _params, _session, socket) do
    {:cont, assign(socket, :page_title, "GuideMe")}
  end

  def on_mount(:user, _params, session, socket) do
    socket =
      assign_new(socket, :current_user, fn ->
        get_user(socket, session)
      end)

    if socket.assigns.current_user do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/session/new")}
    end
  end

  def on_mount(:editor, _params, session, socket) do
    socket =
      assign_new(socket, :current_user, fn ->
        get_user(socket, session)
      end)

    if socket.assigns.current_user.has_role(:editor) do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/session/new")}
    end
  end

  def on_mount(:admin, _params, session, socket) do
    socket =
      assign_new(socket, :current_user, fn ->
        get_user(socket, session)
      end)

    if socket.assigns.current_user.has_role(:admin) do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/session/new")}
    end
  end

  defp get_user(socket, session, config \\ [otp_app: :guideme])

  defp get_user(socket, %{"guideme_auth" => signed_token}, config) do
    conn = struct!(Plug.Conn, secret_key_base: socket.endpoint.config(:secret_key_base))
    salt = Atom.to_string(Pow.Plug.Session)

    with {:ok, token} <- Pow.Plug.verify_token(conn, salt, signed_token, config),
         {user, _metadata} <- CredentialsCache.get([backend: EtsCache], token) do
      user
    else
      _ -> nil
    end
  end

  defp get_user(_, _, _), do: nil
end
