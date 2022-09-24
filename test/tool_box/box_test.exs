defmodule ToolBox.BoxTest do
  use ToolBox.DataCase

  alias ToolBox.Box

  describe "box" do
    alias ToolBox.Box.BoxItem

    import ToolBox.BoxFixtures

    @invalid_attrs %{short_description: nil, snapshot: nil, url: nil}

    test "list_box/0 returns all box" do
      box_item = box_item_fixture()
      assert Box.list_box() == [box_item]
    end

    test "get_box_item!/1 returns the box_item with given id" do
      box_item = box_item_fixture()
      assert Box.get_box_item!(box_item.id) == box_item
    end

    test "create_box_item/1 with valid data creates a box_item" do
      valid_attrs = %{short_description: "some short_description", snapshot: "some snapshot", url: "some url"}

      assert {:ok, %BoxItem{} = box_item} = Box.create_box_item(valid_attrs)
      assert box_item.short_description == "some short_description"
      assert box_item.snapshot == "some snapshot"
      assert box_item.url == "some url"
    end

    test "create_box_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Box.create_box_item(@invalid_attrs)
    end

    test "update_box_item/2 with valid data updates the box_item" do
      box_item = box_item_fixture()
      update_attrs = %{short_description: "some updated short_description", snapshot: "some updated snapshot", url: "some updated url"}

      assert {:ok, %BoxItem{} = box_item} = Box.update_box_item(box_item, update_attrs)
      assert box_item.short_description == "some updated short_description"
      assert box_item.snapshot == "some updated snapshot"
      assert box_item.url == "some updated url"
    end

    test "update_box_item/2 with invalid data returns error changeset" do
      box_item = box_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Box.update_box_item(box_item, @invalid_attrs)
      assert box_item == Box.get_box_item!(box_item.id)
    end

    test "delete_box_item/1 deletes the box_item" do
      box_item = box_item_fixture()
      assert {:ok, %BoxItem{}} = Box.delete_box_item(box_item)
      assert_raise Ecto.NoResultsError, fn -> Box.get_box_item!(box_item.id) end
    end

    test "change_box_item/1 returns a box_item changeset" do
      box_item = box_item_fixture()
      assert %Ecto.Changeset{} = Box.change_box_item(box_item)
    end
  end
end
