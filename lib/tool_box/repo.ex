defmodule ToolBox.Repo do
  use Ecto.Repo,
    otp_app: :tool_box,
    adapter: Ecto.Adapters.Postgres
end
