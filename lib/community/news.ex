defmodule Community.News do

  import Ecto.Query, warn: false
  alias Community.Repo

  alias Community.News.Link

  def list_links do
    Repo.all(Link)
  end

  def get_link!(id), do: Repo.get!(Link, id)

  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  def delete_link(link_id) do
    Repo.get(Link, link_id)
    |> resolve_delete_link()
  end

  defp resolve_delete_link(%Link{description: "Ne Brisi"}), do: {:error, "Ne smijem brisati"}
  defp resolve_delete_link(%Link{} = link), do: Repo.delete(link)
  defp resolve_delete_link(nil), do: {:error, "Ne postoji"}


end
