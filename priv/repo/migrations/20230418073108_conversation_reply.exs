defmodule Community.Repo.Migrations.ConversationReply do
  use Ecto.Migration

  def change do
    create table(:conversation_replies) do
      add :message, :string, null: false
      add :conversation_id, references(:conversations, on_delete: :nothing), null: false
      add :sender_id, references(:users, on_delete: :nothing), null: false
      add :timestamp, :naive_datetime, null: false
    end
  end
end
