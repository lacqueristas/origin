class ApplicationController < JSONAPI::ResourceController
  protected def current_session
    if session.has_key?(:account_id)
      @current_session ||= Account.new(session[:account_id])
    end
  end
end
