Rails.application.routes.draw do
  resources :authentications
  resources :sessions
  resources :lines
  resources :brands
  resources :polishes
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
