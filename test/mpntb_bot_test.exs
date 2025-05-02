defmodule MPNTBBotTest do
  use ExUnit.Case
  doctest MPNTBBot

  test "greets the world" do
    assert MPNTBBot.hello() == :world
  end
end
