defmodule Guideme.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :src, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:src])
    |> validate_required([:src])
    |> unique_constraint(:src)
  end
end
