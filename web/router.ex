defmodule BuggyApp.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", BuggyApp.PageController, :index, as: :pages
    get "/A", BuggyApp.TestController, :topic_a
    get "/B", BuggyApp.TestController, :topic_b
  end

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end
end
