module V1
  class ApplicationResource < JSONAPI::Resource
    def self.limited_to(key, relationship)
      define_singleton_method(:create) do |context|
        new(context[key].public_send(relationship).new, context)
      end

      define_singleton_method(:records) do |options = {}|
        options[:context][key].public_send(relationship)
      end
    end

    def self.create_with(*keys)
      define_singleton_method(:creatable_fields) do |context|
        super(context) + keys
      end
    end

    def self.update_with(*keys)
      define_singleton_method(:updatable_fields) do |context|
        super(context) + keys
      end
    end

    def self.show_without(*keys)
      define_method(:fetchable_fields) do
        super.without(keys)
      end
    end

    def meta(_)
      {
        version: "v1"
      }
    end
  end
end
