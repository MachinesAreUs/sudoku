defmodule Parser do
  def parse(str) do
    [size_str, cells_str] = String.split(str, ";")
    size = String.to_integer(size_str)

    cells_str
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(size)
  end

  def from_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Parser.parse/1)
  end
end
