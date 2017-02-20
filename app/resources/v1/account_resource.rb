module V1
  class AccountResource < ApplicationResource
    attribute :name
    attribute :email
    attribute :password

    def fetchable_fields
      super - [:password]
    end
  end
end
