module V1
  class ApplicationResource < JSONAPI::Resource
    def self.authenticated_scope(relationship)
      define_method(:records) do |options = {}|
        options[:context][:current_account].public_send(relationship)
      end
    end

    def meta(_)
      {
        version: "v1"
      }
    end
  end
end
