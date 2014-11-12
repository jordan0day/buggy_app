defmodule BuggyApp.DB.Models.Product do
  use Ecto.Model

  schema "products" do
    field :name        # defaults to type :string
  end

  validate product,
    name: present()
end