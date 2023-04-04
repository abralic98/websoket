defmodule Community.Message do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Message

  use Ecto.Schema

  schema "messages" do
    field :message, :string
    belongs_to :user, Community.User
  end

  def changeset(user, args) do
    user
    |> cast(args, [:message])
    |> validate_required([:message])
  end

  def list_messages do
    Repo.all(Message)
  end

  def create_message(args) do
    id = Map.get(args, :user_id) |> String.to_integer()
    message = Map.get(args, :message)
    IO.puts("KURCIN")
    IO.inspect(id)

    %Message{
      message: message,
      user_id: id
    }
    |> Repo.insert()
  end
end
