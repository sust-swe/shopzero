Rails.application.routes.draw do
  root 'users#new'
  
  get '/:id/activate',  to: 'account_activations#edit', as: 'activate'
  
  scope 'sessions' do
    get     '/user',      to: 'sessions#new',     as: 'new'
    post    '/login',     to: 'sessions#create',  as: 'create'
    delete  '/logout',    to: 'sessions#destroy', as: 'destroy'
  end
  
  resources :users
end
