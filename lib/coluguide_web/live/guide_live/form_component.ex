defmodule ColuguideWeb.GuideLive.FormComponent do
  use ColuguideWeb, :live_component

  alias Coluguide.Guides
  alias Coluguide.Chapters

  defp list_chapter_ids do
    Chapters.list_chapters()
    |> Enum.map(&{&1.title, &1.id})
  end

  defp list_template_ids do
    Guides.list_templates()
    |> Enum.map(&{&1.name, &1.id})
  end

  @impl true
  def update(%{guide: guide} = assigns, socket) do
    changeset = Guides.change_guide(guide)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"guide" => guide_params}, socket) do
    changeset =
      socket.assigns.guide
      |> Guides.change_guide(guide_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"guide" => guide_params}, socket) do
    save_guide(socket, socket.assigns.action, guide_params)
  end

  defp save_guide(socket, :edit, guide_params) do
    case Guides.update_guide(socket.assigns.guide, guide_params) do
      {:ok, guide} ->
        notify_parent({:saved, guide})

        {:noreply,
         socket
         |> put_flash(:info, "Guide updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_guide(socket, :new, guide_params) do
    case Guides.create_guide(
           Chapters.get_chapter!(guide_params["chapter_id"]),
           guide_params
         ) do
      {:ok, guide} ->
        notify_parent({:saved, guide})

        {:noreply,
         socket
         |> put_flash(:info, "Guide created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
