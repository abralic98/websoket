defmodule Community.Repo.Migrations.Addmessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :room_id, references(:rooms, on_delete: :nothing), null: false
    end
  end
end
