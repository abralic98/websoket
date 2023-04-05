defmodule Community.User do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.User
  alias Community.Account

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

  def login_user(_kit, args, _kit1) do
    IO.inspect(args.username)
    IO.inspect(args.password)
    username = args.username
    password = args.password

    query =
      from u in User,
        join: a in Account,
        on: u.username == ^username and a.password == ^password,
        limit: 1

    case Repo.one(query) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
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
