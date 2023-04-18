defmodule Community.Repo.Migrations.ConversationReply do
  use Ecto.Migration

  def change do
    create table(:conversation_replies) do
      add :message, :string, null: false
      add :conversation_id, references(:conversations, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :inserted_at, :naive_datetime, null: false
      add :updated_at, :naive_datetime, null: false
    end
  end
end
