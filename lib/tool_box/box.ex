defmodule ToolBox.Box do
  @moduledoc """
  The Box context.
  """

  import Ecto.Query, warn: false
  alias ToolBox.Repo

  alias ToolBox.Box.BoxItem

  @doc """
  Returns the list of box.

  ## Examples

      iex> list_box()
      [%BoxItem{}, ...]

  """
  def list_box do
    Repo.all(BoxItem)
  end

  @doc """
  Gets a single box_item.

  Raises `Ecto.NoResultsError` if the Box item does not exist.

  ## Examples

      iex> get_box_item!(123)
      %BoxItem{}

      iex> get_box_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_box_item!(id), do: Repo.get!(BoxItem, id)

  @doc """
  Creates a box_item.

  ## Examples

      iex> create_box_item(%{field: value})
      {:ok, %BoxItem{}}

      iex> create_box_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_box_item(attrs \\ %{}) do
    %BoxItem{}
    |> BoxItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a box_item.

  ## Examples

      iex> update_box_item(box_item, %{field: new_value})
      {:ok, %BoxItem{}}

      iex> update_box_item(box_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_box_item(%BoxItem{} = box_item, attrs) do
    box_item
    |> BoxItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a box_item.

  ## Examples

      iex> delete_box_item(box_item)
      {:ok, %BoxItem{}}

      iex> delete_box_item(box_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_box_item(%BoxItem{} = box_item) do
    Repo.delete(box_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking box_item changes.

  ## Examples

      iex> change_box_item(box_item)
      %Ecto.Changeset{data: %BoxItem{}}

  """
  def change_box_item(%BoxItem{} = box_item, attrs \\ %{}) do
    BoxItem.changeset(box_item, attrs)
  end
end
