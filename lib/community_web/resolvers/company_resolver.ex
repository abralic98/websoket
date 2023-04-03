defmodule CommunityWeb.Resolvers.CompanyResolver do
  alias Community.Company

  def all_companies(_root, _args, _info) do
    {:ok, Company.list_companies}
  end
end
