defmodule Validator do
  def valid?(board) do
    valid_rows?(board) and valid_cols?(board) and valid_areas?(board)
  end

  def valid_rows?(board), do: board |> rows |> all_valid?

  def valid_cols?(board), do: board |> columns |> all_valid?

  def valid_areas?(board), do: board |> areas |> all_valid?

  def rows(board), do: board

  def columns(board), do: Matrix.transpose(board)

  def areas(board), do: Matrix.sqrt_areas(board)

  def all_valid?(seqs) do
    Enum.all?(seqs, &valid_seq?/1)
  end

  def valid_seq?(seq) do
    expected_nums = 1..length(seq) |> Enum.to_list()
    ord_seq = Enum.sort(seq)
    expected_nums == ord_seq
  end
end
