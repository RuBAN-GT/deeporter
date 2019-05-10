use Mix.Config

config :deeclient,
  app_id: "123456",
  app_domain: "localhost:3000",
  permissions: ~w{basic_access manage_library},
  redirect_url: "http://localhost:3000/callback",
  secret: "secret_key"
