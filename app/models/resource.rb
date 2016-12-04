class Resource
  include ActiveModel::Model

  CREATED_AT = Time.now

  attr_accessor :namespace
  attr_accessor :version
  attr_accessor :intent
  attr_accessor :method
  attr_accessor :href
  attr_accessor :query
  attr_accessor :allowed
  attr_accessor :mediatype
  attr_accessor :description

  def self.all
    JSON.parse(ERB.new(File.read(Rails.root.join("config", "resources.json"))).result).map(&method(:new))
  end

  def id
    "#{namespace}-#{version}-#{intent}"
  end

  def created_at
    CREATED_AT
  end
end
