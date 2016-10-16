module Lacqueristas
  module Mediatype
    class JSON
      include ActiveModel::Model

      NAMESPACE = "application/lacqueristas.api"

      attr_accessor :protocol_name
      attr_accessor :protocol_version

      def matches?(request)
        request.headers["CONTENT_TYPE"] == "#{NAMESPACE}+#{schema}; #{metadata}"
      end

      private def metadata
        "protocol-name=#{protocol_name} protocol-version=#{protocol_version}"
      end

      private def schema
        self.class.model_name.element
      end
    end
  end
end
