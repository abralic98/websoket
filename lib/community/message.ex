defmodule Community.Message do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Message
  alias Community.User
  alias Community.Room

  use Ecto.Schema

  schema "messages" do
    field :message, :string
    belongs_to :user, User
    belongs_to :room, Room
  end

  def changeset(user, args) do
    user
    |> cast(args, [:message])
    |> validate_required([:message])
  end

  def list_messages(args) do
    roomID = Map.get(args, :room_id)

    query =
      from m in Message,
        join: u in User,
        on: m.user_id == u.id,
        join: r in Room,
        on: m.room_id == r.id,
        where: m.room_id == ^roomID

    query =
      from [m, u, r] in query,
        select: %{m | user: u, room: r}

    Repo.all(query)
  end

  def create_message(args) do
    userid = Map.get(args, :user_id) |> String.to_integer()
    roomid = Map.get(args, :room_id) |> String.to_integer()
    message = Map.get(args, :message)

    %Message{
      message: message,
      user_id: userid,
      room_id: roomid
    }
    |> Repo.insert()
  end
end
