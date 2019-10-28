defmodule Ping do
  def start do
    loop()
  end

  def loop do
    receive do
      {:pong, from} ->
        IO.puts("ping ->")
        :timer.sleep(90)
        send(from, {:ping, self()})

      {:ping, from} ->
        IO.puts("        <- pong")
        :timer.sleep(90)
        send(from, {:pong, self()})
    end

    loop()
  end
end
