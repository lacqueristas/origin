module StoredAttributes
  extend ActiveSupport::Concern

  private def write_store_attribute(column, key, value)
    accessor = store_accessor_for(column)
    default = public_send("default_#{key}") if respond_to?("default_#{key}")

    if respond_to?("#{key}_will_change!") && accessor.read(self, column, key) != value
      public_send("#{key}_will_change!")
    end

    accessor.write(self, column, key, value || default)
  end

  private def read_store_attribute(column, key)
    accessor = store_accessor_for(column)
    default = public_send("default_#{key}") if respond_to?("default_#{key}")
    value = accessor.read(self, column, key)

    if respond_to?("type_#{key}") && value && value.is_a?(String)
      public_send("type_#{key}").call(value)
    else
      value
    end || default
  end

  class_methods do
    def store_attribute(column, key, default: nil, type: ->(value) { value })
      store_accessor(column, key)

      _store_accessors_module.module_eval do
        define_method("default_#{key}") do
          default
        end

        define_method("type_#{key}") do
          type
        end

        define_method "#{key}_changed?" do |from: nil, to: nil|
          if from && to
            return (changed_attributes[key] == from) && (public_send(key) == to)
          end

          if from
            return changed_attributes[key] == from
          end

          if to
            return public_send(key) == to
          end

          changed_attributes.include?(key)
        end

        define_method "#{key}_was" do
          attribute_was(key)
        end

        define_method "#{key}_change" do
          changed_attributes[key]
        end

        define_method "#{key}_will_change!" do
          attribute_will_change!(key)
        end
      end
    end
  end
end
