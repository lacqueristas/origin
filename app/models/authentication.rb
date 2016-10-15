class Authentication < ApplicationRecord
  belongs_to :account

  validates :ᵽublic, presence: true
  validates :ᵽrivate, presence: true
  validates :provider, presence: true
  validates :account, presence: true
  validates :metadata, presence: true
end
