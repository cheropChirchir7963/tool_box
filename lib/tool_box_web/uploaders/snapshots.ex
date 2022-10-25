defmodule ToolBoxWeb.Uploaders.Snapshots do
  use Waffle.Definition
  use Waffle.Ecto.Definition

  @versions [:original]
  @extension_whitelist ~w(.jpg .jpeg .gif .png .svg)

  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname() |> String.downcase()
    IO.inspect(file_extension)

    case Enum.member?(@extension_whitelist, file_extension) do
      true -> :ok
      false -> {:error, "file type is invalid"}
    end
  end

  # def transform(:thumb, _) do
  #   {:convert, "-thumbnail 100x100^ -gravity center -extent 100x100 -format png", :png}
  # end

  def filename(version, _) do
    version
  end

  def storage_dir(_, {_file, _user}) do
    # IO.inspect(user)
    "uploads/snapshots/"
  end

  def default_url(_version) do
    ToolBoxWeb.Endpoint.url() <> "/snapshots/placeholders/profile_image.png"
  end
end
