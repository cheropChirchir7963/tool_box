import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :tool_box, ToolBox.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tool_box_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# config :ex_secrets, :on_secret_fetch_limit_reached, :ignore

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tool_box, ToolBoxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Ez9BYv9GRE64FpMaaUHaus2/aUi/iewA9wIQ5tJhyNRUt5E3QO90oK/+XpKvo+82",
  server: false

# In test we don't send emails.
config :tool_box, ToolBox.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
