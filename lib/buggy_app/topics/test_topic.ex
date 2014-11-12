defmodule BuggyApp.Topics.TestTopic do
	require Logger

  def start_link do
    sub = spawn_link &(handle_events/0)
    Phoenix.Topic.subscribe(sub, "buggy")
    {:ok, sub}
  end

  def handle_events do
    receive do
    	{ :A, params } ->
    		Logger.info "Got event A. Params: #{inspect params}"
    	{ :B, params } ->
    		Logger.info "Got event B. Params: #{inspect params}"
    	{ unknown, params } ->
    		Logger.error "Got unknown event (#{inspect unknown}) with params: #{inspect params}"
    end
    handle_events
  end

  @doc """
  Method called to generate a deployment build request

  ## Options
  
  The `options` options defines a a Map of push event-specific options.

  """
  @spec broadcast(Map) :: term
  def broadcast(options) do
    Phoenix.Topic.broadcast "buggy", options
  end  
end