defmodule CommunityWeb.Graphql.Types.ConversationType do

  use Absinthe.Schema.Notation

  object :conversation do
    field :id, non_null(:id)
    field :user_one, :user
    field :user_two, :user
    field :conversation_replies, list_of(:conversation_reply)
  end
end
