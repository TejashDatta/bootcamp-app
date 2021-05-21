Rails.application.routes.draw do
  root "static_pages#home"
  get "/log", to: "static_pages#log", as: :log
  get "/sql", to: "static_pages#sql", as: :sql
  resources :users
end
