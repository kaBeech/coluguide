defmodule Guideme.Steps.StepImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "step_images" do
    has_one :image, Guideme.Images.Image
    field :alt, :string
    belongs_to :step, Guideme.Steps.Step

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(step_image, attrs) do
    step_image
    |> cast(attrs, [:image_id, :alt, :step_id])
    |> validate_required([:image_id, :alt, :step_id])
  end
end
