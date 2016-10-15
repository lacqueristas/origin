class Account < ApplicationRecord
  has_many :authentications

  validates :name, presence: true
  validates :metadata, presence: true
  validates :authentications, presence: true
end
