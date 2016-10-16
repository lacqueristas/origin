module Lacqueristas
  module Mediatype
    class JSON
      include ActiveModel::Model

      NAMESPACE = "application/lacqueristas.api"

      attribute :protocol
      attribute :version

      def matches?(request)
        request.headers["HTTP_CONTENT_TYPE"] == "#{NAMESPACE}; #{metadata}"
      end

      private def metadata
        "protocol-name=#{protocol} protocol-version=#{version}"
      end
    end
  end
end
