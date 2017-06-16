# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :star_wars,
  ecto_repos: [StarWars.Repo]

# Configures the endpoint
config :star_wars, StarWars.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ALMJrIAgZbuszyKyIBhdpV0Xb2LFziDzm+2th8FPGEpB+dz2ySwXH9ZTyrAaPygH",
  render_errors: [view: StarWars.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StarWars.PubSub,
           adapter: Phoenix.PubSub.PG2],
  instrumenters: [PryIn.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :pryin,
  api_key: System.get_env("PRYIN_API_KEY"),
  otp_app: :star_wars,
  enabled: false,
  env: :dev

config :star_wars, StarWars.Repo,
  loggers: [PryIn.EctoLogger, Ecto.LogEntry]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
