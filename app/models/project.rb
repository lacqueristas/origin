class Project < ApplicationRecord
  belongs_to :account
  has_many :photographs

  validates :account, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :painted_at, presence: true
end
