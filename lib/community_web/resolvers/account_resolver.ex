defmodule CommunityWeb.Resolvers.AccountResolver do


  alias Community.Account

  def all_accounts(_root, _args, _info) do
    {:ok, Account.list_accounts()}
  end

  def create_account(__root, args, __info) do
    Account.create_account(args)
  end
end
