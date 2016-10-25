class Session
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password

  def id
    SecureRandom.hex
  end

  def account
    @account ||= Account.find_by(email: email).try(:authenticate, password)
  end
end
