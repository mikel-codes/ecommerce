Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    end
  resources :users
  resources :orders
  resources :cart_lines
  resources :carts
  
  resources :products

  root "catalog#index", as: 'shop/products' 


end
