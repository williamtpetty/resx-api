Rails.application.routes.draw do

  get "/users" => "users#index"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  post "/sessions" => "sessions#create"

end
