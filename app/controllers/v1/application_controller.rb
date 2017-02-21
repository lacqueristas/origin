module V1
  class ApplicationController < JSONAPI::ResourceController
    def self.has_authentication
      before_action :ensure_authentication!
      define_method :context do
        {
          current_account: current_account
        }
      end
    end

    private def current_session
      if bearer_token.present?
        @current_session ||= Session.new(authentication["id"])
      end
    end

    private def current_account
      if current_session
        @current_account ||= current_session.account
      end
    end

    private def authentication
      ENCRYPTOR.decrypt_and_verify(bearer_token)
    end

    private def ensure_authentication!
      render status: :unauthorized unless current_session.present?
    end

    private def bearer_token
      headers["rack.authentication"]
    end
  end
end
