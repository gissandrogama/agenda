# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :agenda,
  ecto_repos: [Agenda.Repo]

# Configures the endpoint
config :agenda, AgendaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+PqHWm87yP/FIqQ1wWUnK6kp30NxjJlkvK43/MmsvoCoZhvx+fhNQSrHXf+jf3lG",
  render_errors: [view: AgendaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Agenda.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "g+QUsl2g"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :agenda, AgendaWeb.Guardian,
  issuer: "agenda_web",
  secret_key: "WV0vOU5AQlBgkF1aHyf7+zBMc02gQfHq9z+CGl3gvNxZPRx+T5vfa4guyyj3ioTU"

config :agenda, AgendaWeb.AuthAccessPipeline,
  module: AgendaWeb.Guardian,
  error_handler: AgendWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
