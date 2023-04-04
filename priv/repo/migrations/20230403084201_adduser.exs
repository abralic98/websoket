defmodule Community.Repo.Migrations.Adduser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :account_id, references(:accounts, on_delete: :nothing), null: false
    end
  end
end
