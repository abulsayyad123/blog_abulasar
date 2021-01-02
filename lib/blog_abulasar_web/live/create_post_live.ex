defmodule BlogAbulasarWeb.CreatePostLive do
  use BlogAbulasarWeb, :live_view

  alias BlogAbulasar.Blogs.{ Blog, Post }
  alias BlogAbulasarWeb.PostDetailLive
  alias BlogAbulasarWeb.BlogIndexLive

  def mount(_params, _session, socket) do
    changeset = Blog.change_post(%Post{})
    socket = assign(socket, :changeset, changeset)
    {:ok, socket}
  end

  def handle_event("save", %{"post" => post_params}, socket) do
    IO.inspect(post_params)
    case Blog.create_post(post_params) do
      {:ok, post} ->
        {:noreply,
         socket
         |> put_flash(:info, "user created")
         |> redirect(to: "/")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def render(assigns) do
    ~L"""
        <%= f = form_for @changeset, "#", [phx_submit: :save, class: "w-full max-w-xs bg-white flex flex-col py-5 px-8 rounded-lg shadow-lg"]  %>
          <%= label f, :title, class: "text-gray-700 font-bold py-2" %>
          <%= text_input f, :title, class: "text-gray-700 shadow border rounded border-gray-300 focus:outline-none focus:shadow-outline py-1 px-3 mb-3" %>
          <%= error_tag f, :title %>

          <%= label f, :body, class: "text-gray-700 font-bold py-2" %>
          <%= textarea f, :body, class: "text-gray-700 shadow border rounded border-gray-300 focus:outline-none focus:shadow-outline py-1 px-3 mb-3" %>
          <%= error_tag f, :body %>

          <%= label f, :created_by_id, class: "text-gray-700 font-bold py-2" %>
          <%= text_input f, :created_by_id, value: 1,  class: "text-gray-700 shadow border rounded border-gray-300 focus:outline-none focus:shadow-outline py-1 px-3 mb-3" %>
          <%= error_tag f, :created_by_id %>

          <%= label f, :published, class: "text-gray-700 font-bold py-2" %>
          <%= text_input f, :published, value: true,  class: "text-gray-700 shadow border rounded border-gray-300 focus:outline-none focus:shadow-outline py-1 px-3 mb-3" %>
          <%= error_tag f, :published %>

          <%= submit "Save", class: "bg-blue-500 hover:bg-blue-700 text-white font-bold rounded py-2 px-4" %>

        </form>

     """
  end
end
