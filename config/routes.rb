Rails.application.routes.draw do
  scope '/v1' do
    constraint(Lacqueristas::Mediatype::JSON.new(jsonapi: "1.1")) do
      resources :sessions
      resources :lines
      resources :brands
      resources :polishes
      resources :accounts
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
