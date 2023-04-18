defmodule Community.Conversation do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.User
  alias Community.Conversation
  alias Community.ConversationReply

  use Ecto.Schema

  schema "conversations" do
    belongs_to :user_one, User
    belongs_to :user_two, User
    has_many :conversation_replies, ConversationReply
  end

  def changeset(user, args) do
    user
    |> cast(args, [:name, :password])
    |> validate_required([:name])
  end

  def list_user_conversations(user) do
    query =
      from c in Conversation,
        join: u in User,
        on: c.user_one_id == u.id or c.user_two_id == u.id,
        where: c.user_one_id == ^user.user_id or c.user_two_id == ^user.user_id,
        join: r in ConversationReply,
        on: r.conversation_id == c.id and r.user_id == u.id,
        select: %{c | user_one: u, user_two: u, conversation_replies: r}

    Repo.all(query)
  end

  def create_conversation(args) do
    user_one = Map.get(args, :user_one_id) |> String.to_integer()
    user_two = Map.get(args, :user_two_id) |> String.to_integer()
    IO.inspect(user_one)

    %Conversation{
      user_one_id: user_one,
      user_two_id: user_two
    }
    |> Repo.insert()
  end

  def create_conversation_reply(args) do
    conversationId = Map.get(args, :conversation_id) |> String.to_integer()
    userId = Map.get(args, :user_id) |> String.to_integer()
    message = Map.get(args, :message)

    %ConversationReply{
      message: message,
      user: Repo.get(User, userId),
      conversation: Repo.get(Conversation, conversationId),
      inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    }
    |> Repo.insert()
  end
end
