defmodule Community.Room do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Message
  alias Community.Room

  use Ecto.Schema

  schema "rooms" do
    field :name, :string
    field :password, :string
    has_many :messages, Message
  end

  def changeset(user, args) do
    user
    |> cast(args, [:name, :password])
    |> validate_required([:name])
  end

  def list_rooms do
    # query =
    #   from r in Room,
    #     left_join: m in Message,
    #     on: m.room_id == r.id

    # query =
    #   from [m, r] in query,
    #     select: %{r | messages: m}

    # IO.inspect(query)
    Repo.all(Room)
  end

  def create_room(args) do
    IO.inspect(args)
    name = Map.get(args, :name)
    password = Map.get(args, :password)

    %Room{
      name: name,
      password: password
    }
    |> Repo.insert()
  end
end
