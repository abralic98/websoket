defmodule CommunityWeb.Resolvers.UserResolver do
  alias Community.User

  def all_users(_root, _args, _info) do
    {:ok, User.list_users()}
  end

  def create_user(account, args) do
    IO.puts("KURCINADOTOKIJA")
    IO.inspect(account)
    User.create_user(account, args)
  end
end
