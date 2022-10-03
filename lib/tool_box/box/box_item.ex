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
    |> validate_url()
  end

  @doc """
  Validates that the url start with either http or https
  """
  def validate_url(changeset) do
    regex = ~r/^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$/

    changeset
    |> validate_format(:url, regex, message: "must start with either http:// or https://")
  end
end
