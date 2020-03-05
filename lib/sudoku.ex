defmodule Sudoku do
  def validate_from_file(file) do
    file
    |> Parser.from_file()
    |> Enum.map(&Validator.valid?/1)
  end
end
