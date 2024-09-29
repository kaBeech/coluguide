defmodule GuideMe.Steps.DetailsLink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "details_links" do
    belongs_to :step, GuideMe.Steps.Step
    belongs_to :guide, GuideMe.Guides.Guide

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(details_link, attrs) do
    details_link
    |> cast(attrs, [:step_id, :guide_id])
    |> validate_required([:step_id, :guide_id])
  end
end
