defmodule ToolBox.Repo.Migrations.CreateSnapshotsTable do
  use Ecto.Migration

  def change do
    create table(:snapshots) do
      add :snapshot, :string
      add :uuid, :string
      add :box_id, references(:box, on_delete: :delete_all)

      timestamps()
    end
  end
end
