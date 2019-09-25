Rails.application.routes.draw do
  root 'users#new'
  scope 'admin' do
  	get '/new', to: 'admin#new'
  end
  scope 'users' do
    post '/signup', to: 'users#create'
  end
end
