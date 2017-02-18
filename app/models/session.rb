class Session
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password
  attr_accessor :account

  validates :account, presence: true

  def id
    SecureRandom.hex
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
