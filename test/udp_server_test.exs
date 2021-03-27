defmodule UDPServerTest do
  use ExUnit.Case
  doctest UDPServer

  test "greets the world" do
    assert UDPServer.hello() == :world
  end
end
