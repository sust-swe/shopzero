Rails.application.routes.draw do
  root 'test_react_codes#index'
  get '/signup', to: 'users#new'
  resources :users
end
