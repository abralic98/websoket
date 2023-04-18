defmodule Community.Conversation do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Conversation
  alias Community.ConversationReply

  use Ecto.Schema

  schema "conversations" do
    field :user_one, :id
    field :user_two, :id
    has_many :conversation_replies, ConversationReply
  end

  def changeset(user, args) do
    user
    |> cast(args, [:name, :password])
    |> validate_required([:name])
  end

  def list_user_conversations(user) do
    IO.inspect(user.user_id)

    query =
      from c in Conversation,
        where: c.user_one == ^user.user_id or c.user_two == ^user.user_id

    Repo.all(query)
  end

  def create_conversation(args) do
    user_one = Map.get(args, :user_one) |> String.to_integer()
    user_two = Map.get(args, :user_two) |> String.to_integer()
    IO.inspect(user_one)

    %Conversation{
      user_one: user_one,
      user_two: user_two
    }
    |> Repo.insert()
  end
end
