class ResourceResource < ApplicationResource
  attribute :namespace
  attribute :version
  attribute :intent
  attribute :verb, key: "method"
  attribute :href
  attribute :allowed
  attribute :mediatype
  attribute :description

  def self.default_sort
    []
  end

  def verb
    @model.method
  end
end
