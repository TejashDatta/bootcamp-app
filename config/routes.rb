Rails.application.routes.draw do
  resources :users
  resource :all_logs, only: %i[show]
  resource :sql_logs, only: %i[show]
end
