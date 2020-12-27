defmodule BlogAbulasar.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogAbulasar.Accounts.User

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :user_name, :string
    field :password, :string
    field :email, :string
    field :is_verified, :boolean

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :user_name, :password, :email, :is_verified])
    |> unique_constraint(:email)
    |> unique_constraint(:user_name)
    |> validate_required([:first_name, :last_name, :user_name, :password, :email])
  end

end
