defmodule CommunityWeb.Graphql.Types.ConversationReplyType do
  use Absinthe.Schema.Notation

  object :conversation_reply do
    field :id, non_null(:id)
    field :message, non_null(:string)
    field :user, :user
    field :conversation, :conversation
  end
end
