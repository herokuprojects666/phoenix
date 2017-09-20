# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kochava,
  ecto_repos: [Kochava.Repo]

# Configures the endpoint
config :kochava, KochavaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h2I0JYUKB8a1FU50nTiT6KwmBStAewfjFmWMJbMgxBhnYXig8qJflJ6eB7WZolCT",
  render_errors: [view: KochavaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kochava.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :cors_plug,
	origin: ["http://go.kochava.com"],
	max_age: 86400,
	methods: ["GET", "POST"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
