defmodule DB.Models.Product.Test do
  use ExUnit.Case

  alias BuggyApp.DB.Models.Product
  alias BuggyApp.Repo

  setup _context do
    on_exit _context, fn ->
      Repo.delete_all(Product)
    end
  end

  test "product names must be unique" do
    product1 = %Product{name: "test"}
    Repo.insert(product1)

    assert_raise Postgrex.Error,
                 "ERROR (23505): duplicate key value violates unique constraint \"products_name_key\"",
                 fn -> Repo.insert(product1) end
  end

  test "product name is required" do
    product = %Product{id: 1}
    result = Product.validate(product)

    assert length(result) != 0
    assert Keyword.has_key?(result, :name)
  end
end