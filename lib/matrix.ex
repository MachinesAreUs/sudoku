defmodule Matrix do
  def transpose(mtx) do
    mtx
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def sqrt_areas(mtx) do
    sqr_size = mtx |> length |> :math.sqrt() |> trunc
    row_groups = Enum.chunk_every(mtx, sqr_size)

    Enum.flat_map(row_groups, fn row_group ->
      rowgroup_areas(row_group)
    end)
  end

  defp rowgroup_areas(row_group) do
    sqr_size = length(row_group)

    for area <- 0..(sqr_size - 1) do
      Enum.flat_map(row_group, fn row ->
        row
        |> Enum.drop(area * sqr_size)
        |> Enum.take(sqr_size)
      end)
    end
  end
end
