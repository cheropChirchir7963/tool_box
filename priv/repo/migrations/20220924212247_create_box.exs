defmodule ToolBox.Repo.Migrations.CreateBox do
  use Ecto.Migration

  def change do
    create table(:box) do
      add :url, :string
      add :short_description, :string
      add :snapshot, :string

      timestamps()
    end
  end
end
