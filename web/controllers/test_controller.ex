defmodule BuggyApp.Controllers.TestController do
	use Phoenix.Controller
	plug :action

	def topic_a(conn, _params) do
		BuggyApp.Topics.TestTopic.broadcast({ 
			:A, 
			some_key: "some value"
			})

		json conn, :ok, ""
	end

	def topic_b(conn, _params) do
		BuggyApp.Topics.TestTopic.broadcast({
			:B,
			another_key: "another value"
			})

		json conn, :ok, ""
	end
end