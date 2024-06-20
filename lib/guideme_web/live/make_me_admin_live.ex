defmodule GuidemeWeb.MakeMeAdminLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
  alias Guideme.Users

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Users.set_admin_role(@adminAttempt))
      )

    {:ok, socket}
  end

  defp verify_admin_attempt(%{"admin_attempt" => params}) do
    if params.password == "admin" do
      {:ok, params.user}
    else
      {:error, nil}
    end
  end

  def handle_event("make-me-admin", %{"admin_attempt" => params}, socket) do
    case verify_admin_attempt(params) do
      {:ok, user} ->
        {:noreply, assign(socket, form: to_form(user))}

      {:error, _} ->
        {:error, nil, socket}
    end
  end
end
