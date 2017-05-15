module V1
  class SessionResource < ApplicationResource
    attribute :email
    attribute :bearer
    attribute :password
    attribute :created_at

    has_one :account, always_include_linkage_data: true

    def fetchable_fields
      super - [:password, :email]
    end
  end
end
