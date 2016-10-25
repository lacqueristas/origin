class Account < ApplicationRecord
  attr_reader :password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A.+@.+\z/
  validates :password, length: {in: 8..1024}
  validate do |record|
    record.errors.add(:password, :blank) unless record.password.present?
  end

  def authenticate(unencrypted_password)
    BCrypt::Password.new(encrypted_password).is_password?(unencrypted_password) && self
  end

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      self.encrypted_password = BCrypt::Password.create(Digest::SHA256.hexdigest(unencrypted_password), cost: cost)
    end
  end
end
