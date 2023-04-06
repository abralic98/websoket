defmodule CommunityWeb.Graphql.Types.RoomType do
  use Absinthe.Schema.Notation

  object :room do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :password, :string
    field :messages, list_of(:message)
  end
end
