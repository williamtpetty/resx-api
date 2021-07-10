Rails.application.routes.draw do
  
  # get "/users" => "users#index"
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

  # get "/images" => "images#index"
  post "/images" => "images#create"
  get "/images/:id" => "images#show"
  delete "/images/:id" => "images#destroy"

  post "/personal_url" => "personal_url#create"

end
