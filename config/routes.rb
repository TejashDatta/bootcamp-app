Rails.application.routes.draw do
  root "static_pages#home"
  get "/log", to: "static_pages#log", as: :log
  get "/sql", to: "static_pages#sql", as: :sql

  get "/login", to: "authentication#new", as: :login
  post "/login", to: "authentication#create"
  delete "/logout", to: "authentication#destroy", as: :logout

  resources :users do
    resources :permissions
  end
  resources :health_information
end
