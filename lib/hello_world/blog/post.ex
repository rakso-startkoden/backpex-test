defmodule HelloWorld.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "blog_posts" do
    field :title, :string
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs, _metadata \\ []) do
    post
    |> cast(attrs, [:title, :views])
    |> validate_required([:title, :views])
  end
end
