ENCRYPTION_KEY_GENERATOR = ActiveSupport::KeyGenerator.new(ENV['ORIGIN_SESSION_PRIVATE'])
ENCRYPTION_KEY = ENCRYPTION_KEY_GENERATOR.generate_key(ENV['ORIGIN_SESSION_SALT'])
ENCRYPTOR = ActiveSupport::MessageEncryptor.new(ENCRYPTION_KEY)