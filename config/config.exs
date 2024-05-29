import Config

config :entity_sports,
  http_client_opts: [],
  client_module: EntitySports.Stub,
  base_url: "https://rest.entitysport.com",
  url_prefix: "/sandbox/cricket",
  token: "c16eaec3abd49e3477yy567836a95ad43",
  exchange_token: "c16eaec3abd49e3477yy567836a95ad43",
  exchange_client_module: EntitySports.Exchange.Stub

import_config "#{config_env()}.exs"
