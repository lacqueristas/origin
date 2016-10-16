class Account < ApplicationRecord
  has_many :authentications

  validates :name, presence: true
  validates :authentications, presence: true
end
