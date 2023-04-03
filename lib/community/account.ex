
defmodule Community.Account do
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Account

  use Ecto.Schema

  schema "accounts" do
    field :email, :string
    field :password, :string
  end

  def changeset(user, args) do
    user
    |> cast(args, [:email, :password ])
    |> validate_required([:email, :password])
  end

  def list_accounts do
    IO.puts("KURCINa")
    Repo.all(Account)
  end

  def create_account(args \\ %{}) do
    %Account{}
    |> Account.changeset(args)
    |> Repo.insert()
  end
end
