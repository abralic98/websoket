import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Community.Finch

config :cors_plug,
  origin: [
    "http://116.203.201.51:4000/",
    "http://localhost:3002",
    "http://localhost:3000"
  ],
  methods: ["GET", "POST", "FETCH", "OPTIONS"]
# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
