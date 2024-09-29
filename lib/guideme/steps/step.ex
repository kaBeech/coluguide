defmodule GuideMe.Steps.Step do
  use Ecto.Schema
  import Ecto.Changeset

  schema "steps" do
    field :full_text, :string
    field :number, :integer
    field :external_link, :string
    belongs_to :guide, GuideMe.Guides.Guide
    has_one :details_link, GuideMe.Steps.DetailsLink
    has_one :step_image, GuideMe.Steps.StepImage

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:full_text, :number, :external_link, :guide_id])
    |> validate_required([:full_text, :number, :guide_id])
    |> unique_constraint([:number, :guide_id])
  end
end
