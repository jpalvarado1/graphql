# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :graphql,
  ecto_repos: [Graphql.Repo]

# Configures the endpoint
config :graphql, GraphqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aQ9ALZrvzF6hc9zTFmNpsriKHCIeCRIbJPd8PG3buZwbkYaewnHeFIq1CgcEqk4y",
  render_errors: [view: GraphqlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Graphql.PubSub,
  live_view: [signing_salt: "YoYEY3a4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config details
config :graphql, Graphql.Guardian,
       issuer: "graphql",
       secret_key: "MeoDiezIiovztsDLkF7KwyI7MfyOV8HdhOLkROafGj+5NQ+03xADzOLI3BGAcw/A"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
