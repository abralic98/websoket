defmodule CommunityWeb.Resolvers.UserResolver do
  alias Community.User

  def all_users(_root, _args, _info) do
    {:ok, User.list_users()}
  end

  def create_user(__root, args, __info) do
    User.create_user(args)
  end
end
