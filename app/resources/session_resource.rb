class SessionResource < ApplicationResource
  attribute :email
  attribute :password
  attribute :created_at

  has_one :account

  def meta(_)
   {
     authentication: ENCRYPTOR.encrypt_and_sign(@model.account.id)
   }
  end

  def fetchable_fields
    super - [:password, :email]
  end
end
