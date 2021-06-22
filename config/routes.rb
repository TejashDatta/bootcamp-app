Rails.application.routes.draw do
  root "static_pages#home"
  get "/log", to: "static_pages#log", as: :log
  get "/sql", to: "static_pages#sql", as: :sql
  get "/normalization", to: "normalization#show", as: :normalization
  post "/toggle_pink_mode", to: "pink_mode#toggle", as: :toggle_pink_mode
  get "/source_code_search", to: "source_code_search#show", as: :source_code_search

  get "/login", to: "authentication#new", as: :login
  post "/login", to: "authentication#create"
  delete "/logout", to: "authentication#destroy", as: :logout

  resources :users do
    resource :permissions, only: %i[show update]
  end
  resources :travelers do
    resource :passport
  end
  resources :investors do
    resources :stock_investments
  end
  resources :technologies
  resources :projects
  resources :employees
  resources :citizens do
    get :index_vulnerable, on: :collection
    get :show_vulnerable, on: :member
    get :edit_vulnerable, on: :member
    patch :update_vulnerable, on: :member
    put :update_vulnerable, on: :member
  end
  resources :messages, only: %i[show new create] do
    get :sent, on: :collection
    get :received, on: :collection
    get :search, on: :collection
  end
end
