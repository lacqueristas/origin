class Session
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password
  attr_accessor :account

  validates :account, presence: true
  validates :id, presence: true

  def id
    ENCRYPTOR.encrypt_and_sign(account_id)
  end

  def account_id
    account.id
  end

  def account
    @account ||= Account.authenticate(email: email, password: password)
  end

  def created_at
    Time.zone.now
  end
end
