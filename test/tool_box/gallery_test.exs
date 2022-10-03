defmodule ToolBox.GalleryTest do
  use ToolBox.DataCase

  alias ToolBox.Gallery

  describe "photos" do
    alias ToolBox.Gallery.Photo

    import ToolBox.GalleryFixtures

    @invalid_attrs %{photo: nil, uuid: nil}

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Gallery.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Gallery.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      valid_attrs = %{photo: "some photo", uuid: "some uuid"}

      assert {:ok, %Photo{} = photo} = Gallery.create_photo(valid_attrs)
      assert photo.photo == "some photo"
      assert photo.uuid == "some uuid"
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      update_attrs = %{photo: "some updated photo", uuid: "some updated uuid"}

      assert {:ok, %Photo{} = photo} = Gallery.update_photo(photo, update_attrs)
      assert photo.photo == "some updated photo"
      assert photo.uuid == "some updated uuid"
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_photo(photo, @invalid_attrs)
      assert photo == Gallery.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Gallery.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Gallery.change_photo(photo)
    end
  end
end
