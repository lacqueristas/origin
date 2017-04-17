class Account < ApplicationRecord
  has_many :projects
  has_many :photographs

  attr_reader :password

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A.+@.+\z/
  validates_length_of :password, in: 8..1024
  validate do |record|
    record.errors.add(:password, :blank) unless record.password.present?
  end

  def self.authenticate(email:, password:)
    find_by(email: email).try(:authenticate, password)
  end

  def authenticate(unencrypted_password)
    BCrypt::Password.new(encrypted_password).is_password?(Digest::SHA256.hexdigest(unencrypted_password)) && self
  end

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      self.encrypted_password = BCrypt::Password.create(Digest::SHA256.hexdigest(unencrypted_password), cost: cost)
    end
  end
end
