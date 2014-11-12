defmodule BuggyApp.DB.Queries.Product do
  alias BuggyApp.Repo
  alias BuggyApp.DB.Models.Product
  import Ecto.Query  

  def get_by_name(name) do
    query = from p in Product,
            where: downcase(p.name) == downcase(^name),
            select: p

    case Repo.all(query) do
      [product | _] -> product
      [] -> nil
    end

    # Products table should have a UNIQUE constraint on name,
    # so we should only ever get a single result
  end
end