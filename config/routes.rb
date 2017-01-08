Rails.application.routes.draw do
  scope '/v1' do
    jsonapi_resources :accounts
    jsonapi_resources :lines
    jsonapi_resources :brands
    jsonapi_resources :polishes
    jsonapi_resources :sessions, only: [:create, :destroy]
    jsonapi_resources :resources, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
