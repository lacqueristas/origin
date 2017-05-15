module V1
  class ProjectResource < ApplicationResource
    attribute :name
    attribute :description
    attribute :painted_at

    has_one :account, always_include_linkage_data: true
    has_many :photographs, always_include_linkage_data: true

    limited_to :current_account, :projects
  end
end
