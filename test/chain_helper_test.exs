defmodule ChainHelperTest do
  use ExUnit.Case
  doctest ChainHelper

  test "greets the world" do
    assert ChainHelper.hello() == :world
  end
end
