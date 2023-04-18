defmodule CommunityWeb.Resolvers.ConversationResolver do

  alias Community.Conversation

  def list_user_conversations(_root, args, _info) do
    {:ok, Conversation.list_user_conversations(args)}
  end

  def create_conversation(args, _priv) do
    Conversation.create_conversation(args)
  end
end
