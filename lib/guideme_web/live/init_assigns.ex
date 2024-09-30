defmodule GuideMeWeb.InitAssigns do
  @moduledoc """
  Ensures common `assigns` are applied to all LiveViews attaching this hook.
  Replace EtsCache with something like Mnesia or Redis for production:
  https://github.com/pow-auth/pow?tab=readme-ov-file#cache-store
  """
  import Phoenix.LiveView
  import Phoenix.Component

  alias GuideMe.{Guides, Steps}
  alias Pow.Store.CredentialsCache
  alias Pow.Store.Backend.EtsCache

  @search_cache :data_cache
  # 5 minutes
  @default_ttl 1000 * 60 * 5

  def with_cache(key, fun, ttl \\ @default_ttl) do
    case Cachex.get(@search_cache, key) do
      {:ok, nil} ->
        result = fun.()
        Cachex.put(@search_cache, key, result, ttl: ttl)
        result

      {:ok, result} ->
        result
    end
  end

  def refresh_search_cache(socket) do
    cache_guide_names = with_cache(:guide_names, fn -> Guides.list_guide_names_and_ids() end)

    cache_step_texts =
      with_cache(:step_texts, fn -> Steps.list_step_guide_ids_and_full_texts() end)

    {:cont,
     socket
     |> assign(:guide_names, cache_guide_names)
     |> assign(:step_texts, cache_step_texts)
     |> assign(:search_results, [])
     |> assign(form: to_form(%{"query" => ""}))}
  end

  def on_mount(:default, _params, _session, socket) do
    {:cont, assign(socket, :page_title, "GuideMe")}
  end

  def on_mount(:user, _params, session, socket) do
    socket =
      assign_new(socket, :current_user, fn ->
        get_user(socket, session)
      end)

    socket = assign(socket, :search_guides_enabled, false)

    if socket.assigns.current_user do
      refresh_search_cache(socket)
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
