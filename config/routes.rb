Rails.application.routes.draw do
  devise_for :admins
  mount ActionCable.server => "/cable"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "users#new"

  get "/:id/activate", to: "account_activations#edit", as: "activate"

  post "auth/login", to: "authenticaton#authenticate"

  scope "sessions" do
    get "/user", to: "sessions#new", as: "current_user_session"
    post "/login", to: "sessions#create", as: "create_session"
    delete "/logout", to: "sessions#destroy", as: "destroy_session"
  end

  scope "users" do
    post "/signup", to: "users#create", as: "create_user"
    get "/:id/update", to: "users#edit", as: "edit_user"
    post "/:id/update", to: "users#update", as: "update_user"
  end

  scope "products" do
    get "/:id/show", to: "products#show", as: "product_show"
    get "/index", to: "products#index", as: "index_products"
    get "/search", to: "products#search", as: "search_product"
  end

  scope "cart_items" do
    post "/create", to: "cart_items#create", as: "create_cart_item"
    get "/cart", to: "cart_items#show", as: "show_cart_items"
    post "/:product_id/update", to: "cart_items#update", as: "update_cart_item"
    get "/test", to: "cart_items#testcart"
  end

  scope "orders" do
    post "/create", to: "orders#create", as: "create_orders"
  end

  resources :brands, only: [:show, :index]
  resources :categories, only: [:show, :index]
end
