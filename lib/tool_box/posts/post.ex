defmodule ToolBox.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :image])
    |> validate_required([:title, :body, :image])
  end
end
