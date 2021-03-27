defmodule UDPServer do
  @moduledoc """
  Documentation for `UDPServer`.
  """

  use GenServer

  def start_link(port \\ 3000) do
    GenServer.start_link(__MODULE__, port) # Start 'er up
  end

  def init(port) do
    :gen_udp.open(port, [:binary, active: true])
  end

  def handle_info({:udp, _socket, _address, _port, data}, socket) do
    handle_packet(data, socket)
  end

  defp handle_packet("quit\n", socket) do
    IO.puts("received: quit")

    :gen_udp.close(socket)

    {:stop, :normal, nil}
  end

  defp handle_packet(data, socket) do
    IO.puts("received: #{String.trim data}")

    {:noreply, socket}
  end
end
