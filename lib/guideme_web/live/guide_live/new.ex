defmodule GuidemeWeb.GuideLive.New do
  use GuidemeWeb, :live_view
  use Phoenix.LiveView

  alias Guideme.{Guides, Guides.Guide, Chapters}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Guides.change_guide(%Guide{}))
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:chapter, Chapters.get_chapter!(id))}
  end

  @impl true
  def handle_event("create", %{"guide" => params}, socket) do
    case Guides.create_guide(params) do
      {:ok, _guide} ->
        changeset = Guides.change_guide(socket.assigns.chapter, %Guide{})
        {:noreply, assign(socket, form: to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
