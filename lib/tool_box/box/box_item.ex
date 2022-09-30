defmodule ToolBox.Box.BoxItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "box" do
    field :short_description, :string
    field :snapshot, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(box_item, attrs) do
    box_item
    |> cast(attrs, [:url, :short_description, :snapshot])
    |> validate_required([:url, :short_description, :snapshot])
  end
end
