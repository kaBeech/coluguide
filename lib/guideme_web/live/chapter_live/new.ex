defmodule GuidemeWeb.ChapterLive.New do
  use GuidemeWeb, :live_component
  use Phoenix.LiveView

  import NavBar

  alias Guideme.{Chapters}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Chapters.change_chapter(%Chapters.Chapter{}))
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("validate", %{"chapter" => chapter_params}, socket) do
    changeset =
      socket.assigns.chapter
      |> Chapters.change_chapter(chapter_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"chapter" => chapter_params}, socket) do
    save_chapter(socket, chapter_params)
  end

  defp save_chapter(socket, chapter_params) do
    case Chapters.create_chapter(chapter_params) do
      {:ok, chapter} ->
        notify_parent({:saved, chapter})

        {:noreply,
         socket
         |> put_flash(:info, "Chapter created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  # def handle_event("create", %{"guide" => params}, socket) do
  #   case Chapters.create_chapter(params) do
  #     {:ok, _chapter} ->
  #       changeset = Chapters.change_chapter(%Chapters.Chapter{})
  #
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "Chapter created successfully")
  #        |> push_patch(to: socket.assigns.patch)}
  #
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, form: to_form(changeset))}
  #   end
  # end
end
