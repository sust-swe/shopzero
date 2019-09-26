Rails.application.routes.draw do
  root 'users#new'
  
  scope 'admin' do
  	resources :admin
  end
<<<<<<< Updated upstream
  scope 'users' do
    post '/signup', to: 'users#create'
  end
=======

  scope 'users' do
    resources :users
  end

>>>>>>> Stashed changes
end
