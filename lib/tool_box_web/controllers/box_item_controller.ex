defmodule ToolBoxWeb.BoxItemController do
  use ToolBoxWeb, :controller

  alias ToolBox.Box
  alias ToolBox.Box.BoxItem

  def index(conn, _params) do
    box = Box.list_box()
    render(conn, "index.html", box: box)
  end

  def new(conn, _params) do
    changeset = Box.change_box_item(%BoxItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"box_item" => box_item_params}) do
    case Box.create_box_item(box_item_params) do
      {:ok, box_item} ->
        conn
        |> put_flash(:info, "Box item created successfully.")
        |> redirect(to: Routes.box_item_path(conn, :show, box_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    box_item = Box.get_box_item!(id)
    render(conn, "show.html", box_item: box_item)
  end

  def edit(conn, %{"id" => id}) do
    box_item = Box.get_box_item!(id)
    changeset = Box.change_box_item(box_item)
    render(conn, "edit.html", box_item: box_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "box_item" => box_item_params}) do
    box_item = Box.get_box_item!(id)

    case Box.update_box_item(box_item, box_item_params) do
      {:ok, box_item} ->
        conn
        |> put_flash(:info, "Box item updated successfully.")
        |> redirect(to: Routes.box_item_path(conn, :show, box_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", box_item: box_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    box_item = Box.get_box_item!(id)
    {:ok, _box_item} = Box.delete_box_item(box_item)

    conn
    |> put_flash(:info, "Box item deleted successfully.")
    |> redirect(to: Routes.box_item_path(conn, :index))
  end
end
