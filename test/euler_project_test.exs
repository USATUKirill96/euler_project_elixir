defmodule EulerProjectTest do
  use ExUnit.Case
  doctest EulerProject

  test "greets the world" do
    assert EulerProject.hello() == :world
  end
end
