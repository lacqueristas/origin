class ApplicationController < JSONAPI::ResourceController
  private def current_session
    if headers["rack.authentication"]
      @current_session ||= Account.new(authentication["session"])
    end
  end

  private def ensure_authentication!
    render status: :unauthorized unless current_session.present?
  end

  private def authentication
    ENCRYPTOR.decrypt_and_verify(headers["rack.authentication"])
  end
end
