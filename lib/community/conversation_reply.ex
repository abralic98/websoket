defmodule Community.ConversationReply do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.User
  alias Community.Conversation

  use Ecto.Schema

  schema "conversation_replies" do
    field :message, :string
    belongs_to :conversation, Conversation
    belongs_to :user, User
  end

  def changeset(user, args) do
    user
    |> cast(args, [:message])
    |> validate_required([:message])
  end


  def list_replies(args) do
    IO.inspect("POSLI DODJI VAMO")
    # conversationID = Map.get(args, :conversation_id)

    # query =
    #   from m in Message,
    #     join: u in User,
    #     on: m.user_id == u.id,
    #     join: r in Room,
    #     on: m.room_id == r.id,
    #     where: m.room_id == ^roomID

    # query =
    #   from [m, u, r] in query,
    #     select: %{m | user: u, room: r}

    # Repo.all(query)
  end

end
