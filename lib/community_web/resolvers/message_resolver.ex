defmodule CommunityWeb.Resolvers.MessageResolver do
  alias Community.Message

  def all_messages(_root, _args, _info) do
    {:ok, Message.list_messages()}
  end

  def create_message(args, _priv) do
    Message.create_message(args)
  end
end
