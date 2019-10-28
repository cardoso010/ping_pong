defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "it respondes to a pong with a ping" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}
  end

  test "it responds to two messages" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, ˆping}
    send(ping, {:pong, self()})
    assert_receive {:ping, ˆping}
  end
end
