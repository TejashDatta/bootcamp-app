Rails.application.routes.draw do
  resources :users
  get "/static_pages/:page" => "static_pages#show"
end
