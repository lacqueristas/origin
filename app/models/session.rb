class Session
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :bearer
  attr_accessor :password
  attr_accessor :account

  validates :account, presence: true
  validates :id, presence: true

  def id
    @id ||= SecureRandom.uuid
  end

  def bearer
    @bearer ||= ENCRYPTOR.encrypt_and_sign(account_id)
  end

  def account
    if instance_variable_defined?(:@bearer)
      Account.find(ENCRYPTOR.decrypt_and_verify(bearer))
    else
      Account.authenticate(email: email, password: password)
    end
  end

  def account_id
    account.try(:id)
  end

  def created_at
    Time.zone.now
  end
end
