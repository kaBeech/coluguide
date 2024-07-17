defmodule GuidemeWeb.StepImageLive.FormComponent do
  use GuidemeWeb, :live_component

  alias Guideme.{Steps, Images}

  defp list_step_ids do
    Steps.list_steps()
    |> Enum.map(&{&1.full_text, &1.id})
  end

  defp list_image_ids do
    Images.list_images()
    |> Enum.map(&{&1.src, &1.id})
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage step_image records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="step_image-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:step_id]} type="select" options={list_step_ids()} label="Step ID" />
        <.input field={@form[:image_id]} type="select" options={list_image_ids()} label="Image ID" />
        <.input field={@form[:alt]} type="text" label="Alt Text" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Step image</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{step_image: step_image} = assigns, socket) do
    changeset = Steps.change_step_image(step_image)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"step_image" => step_image_params}, socket) do
    changeset =
      socket.assigns.step_image
      |> Steps.change_step_image(step_image_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"step_image" => step_image_params}, socket) do
    save_step_image(socket, socket.assigns.action, step_image_params)
  end

  defp save_step_image(socket, :edit, step_image_params) do
    case Steps.update_step_image(socket.assigns.step_image, step_image_params) do
      {:ok, step_image} ->
        notify_parent({:saved, step_image})

        {:noreply,
         socket
         |> put_flash(:info, "Step image updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_step_image(socket, :new, step_image_params) do
    case Steps.create_step_image(
           Steps.get_step!(step_image_params["step_id"]),
           step_image_params
         ) do
      {:ok, step_image} ->
        notify_parent({:saved, step_image})

        {:noreply,
         socket
         |> put_flash(:info, "Step image created successfully")
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
