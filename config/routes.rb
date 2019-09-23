Rails.application.routes.draw do
  root 'users#new'
  scope 'admin' do
  	get '/new', to: 'admin#new'
  end
  resources :admin
end
