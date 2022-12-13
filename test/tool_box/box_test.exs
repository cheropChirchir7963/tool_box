defmodule ToolBox.BoxTest do
  use ToolBox.DataCase

  alias ToolBox.Box

  describe "box" do
    alias ToolBox.Box.BoxItem

    # import ToolBox.BoxFixtures

    @invalid_attrs %{short_description: nil, snapshot: nil, url: nil}
    @valid_attrs %{
      short_description: "some short_description",
      url: "https://testurl.com",
      snapshot: "test/tool_box/wallpaper.png"
    }

    def box_item_fixture(attrs \\ %{}) do
      {:ok, box_item} =
        attrs
        |> Enum.into(%{
          short_description: "some short_description",
          url: "https://testurl.com",
          snapshot: "test/tool_box/wallpaper.png"
        })
        |> ToolBox.Box.create_box_item()

      box_item
    end

    @tag :list_box
    test "list_box/0 returns all box" do
      box_item = box_item_fixture()
      assert Box.list_box() == [box_item]
    end

    @tag :get_box_item
    test "get_box_item!/1 returns the box_item with given id" do
      box_item = box_item_fixture()
      assert Box.get_box_item!(box_item.id) == box_item
    end

    @tag :create_box_item_valid
    test "create_box_item/1 with valid data creates a box_item" do
      assert {:ok, %BoxItem{} = box_item} = Box.create_box_item(@valid_attrs)

      assert box_item.short_description == "some short_description"
      assert box_item.snapshot.file_name == "wallpaper.png"
      assert box_item.url == "https://testurl.com"
    end

    @tag :create_box_item_invalid
    test "create_box_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Box.create_box_item(@invalid_attrs)
    end

    @tag :update_box_item_valid
    test "update_box_item/2 with valid data updates the box_item" do
      box_item = box_item_fixture()

      update_attrs = %{
        short_description: "some updated short_description",
        snapshot: "test/tool_box/meme.png",
        url: "https://updatetesturl.com"
      }

      assert {:ok, %BoxItem{} = box_item} = Box.update_box_item(box_item, update_attrs)
      assert box_item.short_description == "some updated short_description"
      assert box_item.snapshot.file_name == "meme.png"
      assert box_item.url == "https://updatetesturl.com"
    end

    @tag :update_box_item_invalid
    test "update_box_item/2 with invalid data returns error changeset" do
      box_item = box_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Box.update_box_item(box_item, @invalid_attrs)
      assert box_item == Box.get_box_item!(box_item.id)
    end

    @tag :delete_box_item
    test "delete_box_item/1 deletes the box_item" do
      box_item = box_item_fixture()
      assert {:ok, %BoxItem{}} = Box.delete_box_item(box_item)
      assert_raise Ecto.NoResultsError, fn -> Box.get_box_item!(box_item.id) end
    end

    @tag :change_box_item
    test "change_box_item/1 returns a box_item changeset" do
      box_item = box_item_fixture()
      assert %Ecto.Changeset{} = Box.change_box_item(box_item)
    end
  end
end
