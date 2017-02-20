module V1
  class ApplicationResource < JSONAPI::Resource
    def meta(_)
      {
        version: "v1"
      }
    end
  end
end
