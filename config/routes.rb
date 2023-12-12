Rails.application.routes.draw do
  devise_for :users
  resources :outfits
  resources :outfit_items
  resources :items
  
  root "outfits#landing"
  get "/contact", to: "contact#new", as: "new_contact"
  post "/contact", to: "contact#create"
end
