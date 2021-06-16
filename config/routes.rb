Rails.application.routes.draw do
  
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  post "/sessions" => "sessions#create"
  
  get "/listings" => "listings#index"
  post "/listings" => "listings#create"
  get "/listings/:id" => "listings#show"
  patch "/listings/:id" => "listings#update"
  delete "/listings/:id" => "listings#destroy"


end
