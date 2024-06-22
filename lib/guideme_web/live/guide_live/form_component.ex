defmodule GuidemeWeb.GuideLive.FormComponent do
  use GuidemeWeb, :live_component

  alias Guideme.Guides

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage guide records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="guide-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:category]} type="text" label="Category" />
        <.input field={@form[:short_title]} type="text" label="Short title" />
        <.input field={@form[:icon]} type="text" label="Icon" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Guide</.button>
        </:actions>
      </.simple_form>
    </div>
    """
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
    case Guides.create_guide(guide_params) do
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
