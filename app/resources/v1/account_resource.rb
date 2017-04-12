module V1
  class AccountResource < ApplicationResource
    attribute :name
    attribute :email
    attribute :password
    attribute :created_at
    attribute :updated_at

    def fetchable_fields
      super - [:password]
    end
  end
end
