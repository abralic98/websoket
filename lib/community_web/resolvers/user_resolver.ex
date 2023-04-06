defmodule CommunityWeb.Resolvers.UserResolver do
  alias Community.User

  def all_users(_root, _args, _info) do
    {:ok, User.list_users()}
  end

  def create_user(account, args) do
    IO.inspect(account)
    User.create_user(account, args)
  end

  def login_user(__root, args, _info) do
    IO.puts("KURCN")
    IO.inspect(args)
    User.login_user("kita", args, "kita")
  end
end
