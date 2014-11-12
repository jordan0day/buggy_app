defmodule TestControllerTest do
	use ExUnit.Case
	use Plug.Test

	test "topic A returns 200" do
		:meck.new(BuggyApp.Topics.TestTopic, [:passthrough])
		:meck.expect(BuggyApp.Topics.TestTopic, :broadcast, fn _ -> "Test success message" end)

		connection = conn(:get, "/A", nil, [])
		result = BuggyApp.Controllers.TestController.topic_a(connection, %{})

		assert result.status == 200
	after
		:meck.unload(BuggyApp.Topics.TestTopic)
	end

	test "topic B returns 200" do
		:meck.new(BuggyApp.Topics.TestTopic, [:passthrough])
		:meck.expect(BuggyApp.Topics.TestTopic, :broadcast, fn _ -> "Test success message" end)

		connection = conn(:get, "/B", nil, [])
		result = BuggyApp.Controllers.TestController.topic_b(connection, %{})

		assert result.status == 200
	after
		:meck.unload(BuggyApp.Topics.TestTopic)
	end
end