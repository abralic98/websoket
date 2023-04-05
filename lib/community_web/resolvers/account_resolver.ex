defmodule CommunityWeb.Resolvers.AccountResolver do
  alias Community.Account
  alias Community.User
  alias Community.Repo

  def all_accounts(_root, _args, _info) do
    {:ok, Account.list_accounts()}
  end

  def create_account(__root, args, __info) do
    username = args.username
    %{email: email, password: password} = args

    case {Repo.get_by(Account, email: email), Repo.get_by(User, username: username)} do
      {nil, nil} ->
        account_data = %{email: email, password: password}

        Account.create_account(account_data)
        |> User.create_user(username)

      {_, _} ->
        {:error, message: "Account with this username/email Allready Exists"}
    end
  end
end
