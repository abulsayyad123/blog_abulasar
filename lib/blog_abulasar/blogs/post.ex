defmodule BlogAbulasar.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogAbulasar.Accounts.User
  alias BlogAbulasar.Blogs.Post

  schema "posts" do
    field :body, :string
    field :title, :string
    field :url, :string
    field :published, :boolean, default: false
    field :approved, :boolean, default: false

    belongs_to(:created_by, User, foreign_key: :created_by_id)
    belongs_to(:approved_by, User, foreign_key: :approved_by_id)

    timestamps()
  end

  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:body, :title, :url, :published, :approved, :created_by_id, :approved_by_id])
    |> validate_required([:title, :created_by_id])
  end

end
