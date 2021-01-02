defmodule BlogAbulasarWeb.BlogIndexLive do
  use BlogAbulasarWeb, :live_view

  alias BlogAbulasar.Blogs.Blog
  alias BlogAbulasarWeb.PostDetailLive
  alias BlogAbulasarWeb.CreatePostLive

  def mount(_params, _session, socket) do
    all_posts = Blog.list_posts()
    {:ok, assign(socket, :posts, all_posts)}
  end

  def handle_event("navigate_to-detail", %{"id" => id}, socket) do
    {:noreply, push_redirect(socket, to: Routes.live_path(socket, PostDetailLive, id: id))}
  end

  def render(assigns) do
    ~L"""
    <h1 class="text-red-400 text-5xl font-bold text-center">Recent Blogs</h1>
    <%= live_patch "Create Post", to: Routes.live_path(@socket, CreatePostLive), class: "float-right uppercase px-8 py-2 rounded bg-blue-600 text-blue-50 max-w-max shadow-sm hover:shadow-md bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-600 focus:ring-opacity-50" %>


      <div class="container my-12 mx-auto px-4 md:px-12">
        <%= for post <- @posts do %>
          <div class="flex flex-wrap -mx-1 lg:-mx-4" phx-click="navigate_to-detail" phx-value-id= "<%= post.id %>" >
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">
              <article class="overflow-hidden rounded-lg shadow-lg">
                <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                    <h1 class="text-lg">
                        <a class="no-underline hover:underline text-black" href="#">
                            <%= post.title %>
                        </a>
                    </h1>
                    <p class="text-grey-darker text-sm">
                        <%= post.inserted_at %>
                    </p>
                </header>

                <footer class="flex items-center justify-between leading-none p-2 md:p-4">
                    <a class="flex items-center no-underline hover:underline text-black" href="#">
                        <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                        <p class="ml-2 text-sm">
                          <%= post.created_by.first_name %> <%= post.created_by.last_name %>
                        </p>
                    </a>
                    <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                        <span class="hidden">Like</span>
                        <i class="fa fa-heart"></i>
                    </a>
                </footer>
              </article>
            </div>
          </div>
        <% end %>
      </div>

    """
  end
end
