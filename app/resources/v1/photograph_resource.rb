module V1
  class PhotographResource < ApplicationResource
    limited_to :current_account, :photographs

    has_one :account, always_include_to_one_linkage_data: true
    has_one :project, always_include_to_one_linkage_data: true

    attribute :original
    attribute :thumbnail
    attribute :created_at
    attribute :updated_at
  end
end
