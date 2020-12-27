defmodule BlogAbulasar.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :user_name, :string, null: false
      add :password, :string, null: false
      add :email, :string, null: false
      add :is_verified, :boolean, default: false

      timestamps()
    end

    create index(:users, [:first_name, :last_name,])
    create unique_index(:users, [:email])
    create unique_index(:users, [:user_name])
  end
end
