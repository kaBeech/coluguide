defmodule Coluguide.Guides.Template do
  @moduledoc """
  Names of Templates used to display Guides.

  Guides will be presented according to a Template. The two default Templates
  are "chapter", used for the index page of a chapter, which adds tutorial
  information at the top of the page, and "standard", which is used for most
  Guides and omits the tutorial information


  Custom Templates may include space for additional information or custom
  modules, such as a chess clock for a timekeeping Guide within a chess
  Chapter.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "templates" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
