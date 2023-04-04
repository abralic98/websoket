defmodule Community.User do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.User

  use Ecto.Schema

  schema "users" do
    field :username, :string
    belongs_to :account, Community.Account
  end

  def changeset(user, args) do
    user
    |> cast(args, [:username])
    |> validate_required([:username])
  end

  def list_users do
    IO.puts("KURCINa")
    Repo.all(User)
  end

  def create_user(account, username) do
    id = account |> elem(1) |> Map.get(:id)
    IO.inspect(account)

    %User{
      username: username,
      account_id: id
    }
    |> Repo.insert()
  end
end
