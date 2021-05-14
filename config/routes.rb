Rails.application.routes.draw do
  resources :cart_lines
  resources :carts
  get 'shop/products', to: "catalog#index"
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
