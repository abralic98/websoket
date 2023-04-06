defmodule CommunityWeb.Resolvers.MessageResolver do
  alias Community.Message

  def all_messages(_root, args, _info) do
    {:ok, Message.list_messages(args)}
  end

  def create_message(args, _priv) do
    Message.create_message(args)
  end
end
