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

  get "/messages" => "messages#index"
  post "/messages" => "messages#create"

  get "/conversations" => "conversations#index"
  post "/conversations" => "conversations#create"
  get "/conversations/:id" => "conversations#show"
  delete "/conversations/:id" => "conversations#destroy"

  get "/personal_urls" => "personal_urls#index"
  post "/personal_urls" => "personal_urls#create"
  get "/personal_urls/:id" => "personal_urls#show"
  delete "/personal_urls/:id" => "personal_urls#destroy"

  get "/#path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }

end
