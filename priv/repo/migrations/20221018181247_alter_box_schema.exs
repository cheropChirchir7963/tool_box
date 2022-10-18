defmodule ToolBox.Repo.Migrations.AlterBoxSchema do
  use Ecto.Migration

  def change do
    alter table(:box) do
      add :uuid, :string
    end
  end
end
