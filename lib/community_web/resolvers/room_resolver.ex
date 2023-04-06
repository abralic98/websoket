defmodule CommunityWeb.Resolvers.RoomResolver do

  alias Community.Room

  def all_rooms(_root, _args, _info) do
    {:ok, Room.list_rooms}
  end

  def create_room(args, _priv) do
    Room.create_room(args)
  end
end
