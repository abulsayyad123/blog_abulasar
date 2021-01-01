defmodule BlogAbulasar.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :text
      add :title, :string, null: false
      add :url, :string
      add :published, :boolean, default: false
      add :approved, :boolean, default: false
      add :created_by_id, references(:users)
      add :approved_by_id, references(:users)

      timestamps()
    end

    create index(:posts, [:title, :created_by_id])
  end
end
