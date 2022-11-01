defmodule ToolBox.BoxFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ToolBox.Box` context.
  """

  @doc """
  Generate a box_item.
  """
  def box_item_fixture(attrs \\ %{}) do
    {:ok, box_item} =
      attrs
      |> Enum.into(%{
        short_description: "some short_description",
        # snapshot: "some snapshot",
        url: "some url"
      })
      |> ToolBox.Box.create_box_item()

    box_item
  end
end
