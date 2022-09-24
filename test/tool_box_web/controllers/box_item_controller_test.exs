defmodule ToolBoxWeb.BoxItemControllerTest do
  use ToolBoxWeb.ConnCase

  import ToolBox.BoxFixtures

  @create_attrs %{short_description: "some short_description", snapshot: "some snapshot", url: "some url"}
  @update_attrs %{short_description: "some updated short_description", snapshot: "some updated snapshot", url: "some updated url"}
  @invalid_attrs %{short_description: nil, snapshot: nil, url: nil}

  describe "index" do
    test "lists all box", %{conn: conn} do
      conn = get(conn, Routes.box_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Box"
    end
  end

  describe "new box_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.box_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Box item"
    end
  end

  describe "create box_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.box_item_path(conn, :create), box_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.box_item_path(conn, :show, id)

      conn = get(conn, Routes.box_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Box item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.box_item_path(conn, :create), box_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Box item"
    end
  end

  describe "edit box_item" do
    setup [:create_box_item]

    test "renders form for editing chosen box_item", %{conn: conn, box_item: box_item} do
      conn = get(conn, Routes.box_item_path(conn, :edit, box_item))
      assert html_response(conn, 200) =~ "Edit Box item"
    end
  end

  describe "update box_item" do
    setup [:create_box_item]

    test "redirects when data is valid", %{conn: conn, box_item: box_item} do
      conn = put(conn, Routes.box_item_path(conn, :update, box_item), box_item: @update_attrs)
      assert redirected_to(conn) == Routes.box_item_path(conn, :show, box_item)

      conn = get(conn, Routes.box_item_path(conn, :show, box_item))
      assert html_response(conn, 200) =~ "some updated short_description"
    end

    test "renders errors when data is invalid", %{conn: conn, box_item: box_item} do
      conn = put(conn, Routes.box_item_path(conn, :update, box_item), box_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Box item"
    end
  end

  describe "delete box_item" do
    setup [:create_box_item]

    test "deletes chosen box_item", %{conn: conn, box_item: box_item} do
      conn = delete(conn, Routes.box_item_path(conn, :delete, box_item))
      assert redirected_to(conn) == Routes.box_item_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.box_item_path(conn, :show, box_item))
      end
    end
  end

  defp create_box_item(_) do
    box_item = box_item_fixture()
    %{box_item: box_item}
  end
end
