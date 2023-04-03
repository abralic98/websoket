defmodule Community.Repo.Migrations.Addaccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :email, :string, null: false
      add :password, :string, null: false
    end
  end
end
