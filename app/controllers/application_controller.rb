class ApplicationController < JSONAPI::ResourceController
  private def current_session
    if headers["rack.authentication"]
      @current_session ||= Session.new(authentication["id"])
    end
  end

  private def current_account
    if current_session
      @current_account ||= current_session.account
    end
  end

  private def authentication
    ENCRYPTOR.decrypt_and_verify(headers["rack.authentication"])
  end

  private def ensure_authentication!
    render status: :unauthorized unless current_session.present?
  end
end
