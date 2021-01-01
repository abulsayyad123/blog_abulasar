defmodule BlogAbulasar.Blogs.Blog do

  import Ecto.Query
  alias BlogAbulasar.Accounts.User
  alias BlogAbulasar.Blogs.Post

  alias BlogAbulasar.Repo

  def list_posts() do
    from(
      p in Post,
      where: p.published == true
    )
    |> Repo.all
  end

  def get_posts_by_user_id(user_id) do
    from(
      p in Post,
      where: p.created_by_id == ^user_id
    )
    |> Repo.all
  end

  def create_post(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> change_post(attrs)
  end

  def delete_post(post) do
    Repo.delete(post)
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def approve_post(%Post{} = post, attrs) do
    post
    |> change_post(attrs)
  end

  def publish_post(%Post{} = post, attrs) do
    post
    |> change_post(attrs)
  end



  # Private Methods
  defp change_post(post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update
  end

end
