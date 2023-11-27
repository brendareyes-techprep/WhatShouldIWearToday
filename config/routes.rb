Rails.application.routes.draw do
  devise_for :users
  resources :outfits
  resources :outfit_items
  resources :items, only: [:index, :show], path: 'custom_path', as: 'custom_items'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "outfits#landing"
  "outfits#index"
  "outfit_items#index"
end
