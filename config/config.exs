# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :web, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "23YjA7Z3ab685VBE2lcU5AkvKR40CuRj5HNz6sTN5SzAl01vs/u5p5ckkdeifMFT",
  render_errors: [view: Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#config :ex_aws,
#  access_key_id: [{:system, "AKIAJCRKHZ6I6D324QAQ"}, :instance_role],
#  secret_access_key: [{:system, "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"}, :instance_role],
#  region: "us-east-1",
#  debug: true,
#  debug_requests: true

#wd

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
