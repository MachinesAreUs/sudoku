defmodule SudokuBasicTest do
  use ExUnit.Case
  doctest SudokuBasic

  test "greets the world" do
    assert SudokuBasic.hello() == :world
  end
end
