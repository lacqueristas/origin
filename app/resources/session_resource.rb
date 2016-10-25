class SessionResource < JSONAPI::Resource
  attribute :email
  attribute :password

  belongs_to :account

  def fetchable_fields
    super - [:password, :email]
  end
end
