module V1
  class ProjectResource < ApplicationResource
    attribute :name
    attribute :description
    attribute :painted_at

    has_one :account

    limited_to :current_account, :projects
  end
end
