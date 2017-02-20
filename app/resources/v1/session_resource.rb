module V1
  class SessionResource < ApplicationResource
    attribute :email
    attribute :password
    attribute :authentication
    attribute :created_at

    has_one :account, always_include_to_one_linkage_data: true

    def authentication
      ENCRYPTOR.encrypt_and_sign(@model.account_id)
    end

    def fetchable_fields
      super - [:password, :email]
    end
  end
end
