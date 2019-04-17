Rails.application.routes.draw do
  get "/restaurants", to: "restaurants#index", as: "restaurants"
  post "/restaurants", to: "restaurants#create"
  get "/restaurants/new", to: "restaurants#new", as: "new_restaurant"
  get "/restaurants/:id", to: "restaurants#show", as: "restaurant"

  root 'restaurants#index'

end
