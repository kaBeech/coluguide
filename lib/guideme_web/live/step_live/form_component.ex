defmodule GuidemeWeb.StepLive.FormComponent do
  use GuidemeWeb, :live_component

  alias Guideme.{Steps, Guides}

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
        <:subtitle>Use this form to manage step records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="step-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:guide_id]} type="select" options={list_guide_ids()} label="Guide ID" />
        <.input field={@form[:full_text]} type="text" label="Full text" />
        <.input field={@form[:number]} type="number" label="Number" />
        <.input field={@form[:external_link]} type="text" label="External link" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Step</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{step: step} = assigns, socket) do
    changeset = Steps.change_step(step)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"step" => step_params}, socket) do
    changeset =
      socket.assigns.step
      |> Steps.change_step(step_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"step" => step_params}, socket) do
    save_step(socket, socket.assigns.action, step_params)
  end

  defp save_step(socket, :edit, step_params) do
    case Steps.update_step(socket.assigns.step, step_params) do
      {:ok, step} ->
        notify_parent({:saved, step})

        {:noreply,
         socket
         |> put_flash(:info, "Step updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_step(socket, :new, step_params) do
    case Steps.create_step(
           Guides.get_guide!(step_params["guide_id"]),
           step_params
         ) do
      {:ok, step} ->
        notify_parent({:saved, step})

        {:noreply,
         socket
         |> put_flash(:info, "Step created successfully")
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
