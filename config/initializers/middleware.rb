Lacqueristas::Application.config.middleware.use(Rack::AuthenticationBearer, &->(token) do
  begin
    JWT.decode(token, ENV["RAILS_SESSION_PRIVATE"]).first
  rescue JWT::DecodeError
    {}
  end
end)
