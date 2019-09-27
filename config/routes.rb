Rails.application.routes.draw do
  root 'users#new'
  
  scope 'admin' do
  	resources :admin
  end
  # scope 'users' do
  #   # post '/signup', to: 'users#create'
  #   resources :account_activations, only: [:edit]
  # end

  resources :users
  resources :account_activations, only: [:edit]
end
