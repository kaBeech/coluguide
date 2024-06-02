defmodule Guideme.Steps.StepImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "step_images" do
    field :src, :string
    field :alt, :string
    belongs_to :step, Guideme.Steps.Step

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(step_image, attrs) do
    step_image
    |> cast(attrs, [:src, :alt, :step_id])
    |> validate_required([:src, :alt, :step_id])
  end
end
