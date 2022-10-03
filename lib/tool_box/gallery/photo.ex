defmodule ToolBox.Gallery.Photo do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset

  schema "photos" do
    field :photo, ToolBox.Photo.Type
    field :uuid, :string

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> Map.update(:uuid, Ecto.UUID.generate, fn val -> val || Ecto.UUID.generate end)
    |> cast_attachments(attrs, [:photo, :uuid])
    |> validate_required([:photo, :uuid])
  end
end
