defmodule ToolBox.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :photo, :string
      add :uuid, :string

      timestamps()
    end
  end
end
