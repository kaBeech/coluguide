defmodule GuidemeWeb.DetailsLinkLive.FormComponent do
  use GuidemeWeb, :live_component

  alias Guideme.{Steps, Guides}

  defp list_step_ids do
    Steps.list_steps()
    |> Enum.map(&{&1.full_text, &1.id})
  end

  defp list_guide_ids do
    Guides.list_guides()
    |> Enum.map(&{&1.name, &1.id})
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage details_link records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="details_link-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:step_id]} type="select" options={list_step_ids()} label="Step ID" />
        <.input field={@form[:guide_id]} type="select" options={list_guide_ids()} label="Guide ID" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Details link</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{details_link: details_link} = assigns, socket) do
    changeset = Steps.change_details_link(details_link)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"details_link" => details_link_params}, socket) do
    changeset =
      socket.assigns.details_link
      |> Steps.change_details_link(details_link_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"details_link" => details_link_params}, socket) do
    save_details_link(socket, socket.assigns.action, details_link_params)
  end

  defp save_details_link(socket, :edit, details_link_params) do
    case Steps.update_details_link(socket.assigns.details_link, details_link_params) do
      {:ok, details_link} ->
        notify_parent({:saved, details_link})

        {:noreply,
         socket
         |> put_flash(:info, "Details link updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_details_link(socket, :new, details_link_params) do
    case Steps.create_details_link(
           Steps.get_step!(details_link_params["step_id"]),
           details_link_params
         ) do
      {:ok, details_link} ->
        notify_parent({:saved, details_link})

        {:noreply,
         socket
         |> put_flash(:info, "Details link created successfully")
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
