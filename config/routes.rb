Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'users#new'
  
  get '/:id/activate',  to: 'account_activations#edit', as: 'activate'

  post 'auth/login', to: 'authenticaton#authenticate'
  
  scope 'sessions' do
    get     '/user',      to: 'sessions#new',     as: 'current_user_session'
    post    '/login',     to: 'sessions#create',  as: 'create_session'
    delete  '/logout',    to: 'sessions#destroy', as: 'destroy_session'
  end
  
  scope 'users' do
    post      '/signup',      to: 'users#create',     as:  'create_user'
    get       '/:id/update',  to: 'users#edit',       as:  'edit_user'
    post      '/:id/update',  to: 'users#update',       as:  'update_user'
  end

  scope 'brands' do
    post      '/create',      to: 'brands#create'
    
  end

end
