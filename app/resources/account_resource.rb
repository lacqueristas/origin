class AccountResource < JSONAPI::Resource
  attribute :name
  attribute :email
  attribute :password

  def fetchable_fields
    super - [:password]
  end
end
