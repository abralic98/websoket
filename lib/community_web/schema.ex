defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.Resolvers.UserResolver
  alias CommunityWeb.Resolvers.AccountResolver
  alias CommunityWeb.Resolvers.MessageResolver
  alias CommunityWeb.Resolvers.RoomResolver

  import_types(CommunityWeb.Graphql.Types.UserType)
  import_types(CommunityWeb.Graphql.Types.LinkType)
  import_types(CommunityWeb.Graphql.Types.CompanyType)
  import_types(CommunityWeb.Graphql.Types.AccountType)
  import_types(CommunityWeb.Graphql.Types.MessageType)
  import_types(CommunityWeb.Graphql.Types.RoomType)

  # KVERIJI
  query do
    @desc "Get all users"
    field :all_users, list_of(:user) do
      resolve(&UserResolver.all_users/3)
    end

    @desc "Get all messages"
    field :get_messages, list_of(:message) do
      arg(:room_id, non_null(:id))
      resolve(&MessageResolver.all_messages/3)
    end

    @desc "Get all Rooms"
    field :all_rooms, list_of(:room) do
      resolve(&RoomResolver.all_rooms/3)
    end
  end

  # MUTACIJE

  mutation do
    @desc "Login"
    field :login_user, :user do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&UserResolver.login_user/3)
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

    @desc "Create new Message"
    field :create_message, :message do
      arg(:message, non_null(:string))
      arg(:user_id, non_null(:id))
      arg(:room_id, non_null(:id))
      resolve(&MessageResolver.create_message/2)
    end

    @desc "Create new Room"
    field :create_room, :room do
      arg(:name, non_null(:string))
      arg(:password, :string)
      resolve(&RoomResolver.create_room/2)
    end
  end
end
