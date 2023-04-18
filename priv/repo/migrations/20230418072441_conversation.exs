defmodule Community.Repo.Migrations.Conversation do
  use Ecto.Migration

  def change do
    create table(:conversations) do
      add :user_one_id, references(:users, on_delete: :nothing), null: false
      add :user_two_id, references(:users, on_delete: :nothing), null: false
    end
  end
end
