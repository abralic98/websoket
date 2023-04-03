defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver
  alias CommunityWeb.Resolvers.UserResolver
  alias CommunityWeb.Resolvers.CompanyResolver
  alias CommunityWeb.Resolvers.AccountResolver

  import_types(CommunityWeb.Graphql.Types.UserType)
  import_types(CommunityWeb.Graphql.Types.LinkType)
  import_types(CommunityWeb.Graphql.Types.CompanyType)
  import_types(CommunityWeb.Graphql.Types.AccountType)

  # KVERIJI
  query do
    @desc "Get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&NewsResolver.all_links/3)
    end

    @desc "Get all users"
    field :all_users, list_of(:user) do
      resolve(&UserResolver.all_users/3)
    end

    @desc "Get all companies"
    field :get_companies, non_null(list_of(non_null(:company))) do
      resolve(&CompanyResolver.all_companies/3)
    end
  end

  # MUTACIJE

  mutation do
    @desc "Create a new link"
    field :create_link, :link do
      arg(:url, non_null(:string))
      arg(:description, non_null(:string))

      resolve(&NewsResolver.create_link/3)
    end

    @desc "Delete link"
    field :delete_link, :id do
      arg(:id, non_null(:id))
      resolve(&NewsResolver.delete_link/3)
    end

    @desc "Create new Account"
    field :create_account, :account do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:username, non_null(:string))
      resolve(&AccountResolver.create_account/3)
    end

    @desc "Create new User"
    field :create_user, :user do
      arg(:username, non_null(:string))

      resolve(&UserResolver.create_user/2)
    end
  end
end
