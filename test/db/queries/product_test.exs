defmodule DB.Queries.Product.Test do
  use ExUnit.Case

  alias BuggyApp.DB.Models.Product
  alias BuggyApp.Repo
  alias BuggyApp.DB.Queries.Product, as: ProductQuery

  setup _context do
    on_exit _context, fn ->
      Repo.delete_all(Product)
    end
  end

  test "get product by name" do
    product = %Product{name: "test"}
    product = Repo.insert(product)

    result = ProductQuery.get_by_name("test")

    assert result == product
  end

  test "get product by name with non-existant name" do
    product = %Product{name: "test"}
    Repo.insert(product)

    result = ProductQuery.get_by_name("some dumbbad name")

    assert result == nil
  end
end