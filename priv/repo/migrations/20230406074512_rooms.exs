defmodule Community.Repo.Migrations.Rooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string, null: false
      add :password, :string, null: true
    end
  end
end
