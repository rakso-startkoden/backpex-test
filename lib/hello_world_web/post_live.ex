defmodule HelloWorldWeb.PostLive do
  use Backpex.LiveResource,
    layout: {HelloWorldWeb.Layouts, :app},
    schema: HelloWorld.Blog.Post,
    repo: HelloWorld.Repo,
    update_changeset: &HelloWorld.Blog.Post.changeset/3,
    create_changeset: &HelloWorld.Blog.Post.changeset/3,
    pubsub: HelloWorld.PubSub,
    topic: "posts",
    event_prefix: "post_"

  @impl Backpex.LiveResource
  def singular_name, do: "Post"

  @impl Backpex.LiveResource
  def plural_name, do: "Posts"

  @impl Backpex.LiveResource
  def fields do
    [
      title: %{
        module: Backpex.Fields.Text,
        label: "Title"
      },
      views: %{
        module: Backpex.Fields.Number,
        label: "Views"
      }
    ]
  end
end
