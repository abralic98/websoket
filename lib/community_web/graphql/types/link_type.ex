defmodule CommunityWeb.Graphql.Types.LinkType do
  use Absinthe.Schema.Notation

  object :link do
    field :id, non_null(:id)
    field :description, :string
    field :url, :string
  end
end
