module V1
  class ApplicationController < JSONAPI::ResourceController
    def self.has_authentication
      before_action :ensure_authentication!
      rescue_from ActiveSupport::MessageVerifier::InvalidSignature do
        head :unauthorized
      end
      define_method :context do
        {
          current_account: current_account
        }
      end
    end

    private def current_session
      if bearer_token.present?
        @current_session ||= Session.new(bearer: bearer_token)
      end
    end

    private def current_account
      if current_session
        @current_account ||= current_session.account
      end
    end

    private def ensure_authentication!
      head :unauthorized unless current_account.present?
    end

    private def bearer_token
      request.env["rack.authentication"]
    end
  end
end
