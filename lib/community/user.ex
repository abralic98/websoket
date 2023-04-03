defmodule Community.User do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.User

  use Ecto.Schema

  schema "users" do
    field :username, :string
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

  def create_user(args \\ %{}) do
    %User{}
    |> User.changeset(args)
    |> Repo.insert()
  end
end
