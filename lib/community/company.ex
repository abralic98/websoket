defmodule Community.Company do
  import Ecto.Query, warn: false
  alias Community.Repo
  alias Community.Company

  use Ecto.Schema

  schema "companies" do
    field :name, :string
    # timestamps()
  end

  def list_companies do
    IO.puts("KURCINa")
    Repo.all(Company)
  end
end
