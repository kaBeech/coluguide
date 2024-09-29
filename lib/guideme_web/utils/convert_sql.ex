defmodule ConvertSQL do
  use GuideMeWeb, :html
  use Phoenix.Component

  def map_sql_result(%{rows: rows, columns: columns}) do
    Enum.map(rows, fn row ->
      Enum.zip(columns, row)
      |> Enum.into(%{})
    end)
  end
end
