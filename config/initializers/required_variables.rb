REQUIRED_ENVIRONMENT_VARIABLES = %w[
  RAILS_ENV
  ORIGIN_ENCRYPTION_PRIVATE
  ORIGIN_ENCRYPTION_SALT
  RAILS_SESSION_PRIVATE
  ORIGIN_LOCATION
  WWW_LOCATION
]

raise "You're missing #{REQUIRED_ENVIRONMENT_VARIABLES - ENV.keys} environment variables" if (REQUIRED_ENVIRONMENT_VARIABLES - ENV.keys).any?