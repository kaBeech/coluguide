defmodule GuidemeWeb.CreateGuideLive do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView
  # import Phoenix.HTML.Form
  alias Guideme.{Guides, Guides.Guide}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Guides.change_guide(%Guide{}))
      )

    {:ok, socket}
  end

  def handle_event("create", %{"guide" => params}, socket) do
    case Guides.create_guide(params) do
      {:ok, _guide} ->
        changeset = Guides.change_guide(%Guide{})
        {:noreply, assign(socket, form: to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
