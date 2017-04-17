class Photograph < ApplicationRecord
  include StoredAttributes

  belongs_to :account
  belongs_to :project

  validates_presence_of :account
  validates_presence_of :account_id
  validates_presence_of :project
  validates_presence_of :project_id
  validates_presence_of :variations
  validates_presence_of :original
  validates_presence_of :thumbnail

  store_attribute :variations, :original
  store_attribute :variations, :thumbnail
end
