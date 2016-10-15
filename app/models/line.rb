class Line < ApplicationRecord
  belongs_to :brand
  has_many :polishes
end
