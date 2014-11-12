defmodule BuggyApp.Repo.Migrations.AddProductsTable do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE products (
      id           SERIAL,
      name         varchar(128) UNIQUE NOT NULL)
    """
  end

  def down do
    "DROP TABLE products"
  end
end
