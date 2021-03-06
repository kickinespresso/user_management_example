# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :user_management_example,
  ecto_repos: [UserManagementExample.Repo]

# Configures the endpoint
config :user_management_example, UserManagementExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ymht7OF3OfZ9fzNA0IfSaKwFK09k2QIu0WWL7ddLGb0KcGQBvsVaZbtRWLhtKBuK",
  render_errors: [view: UserManagementExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UserManagementExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: UserManagementExample.User,
  repo: UserManagementExample.Repo,
  module: UserManagementExample,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
