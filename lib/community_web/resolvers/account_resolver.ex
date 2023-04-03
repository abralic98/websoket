defmodule CommunityWeb.Resolvers.AccountResolver do
  alias Community.Account
  alias Community.User

  def all_accounts(_root, _args, _info) do
    {:ok, Account.list_accounts()}
  end

  def create_account(__root, args, __info) do
    username = args.username
    %{email: email, password: password} = args
    account_data = %{email: email, password: password}

    Account.create_account(account_data)
    |> User.create_user(username)
  end
end
