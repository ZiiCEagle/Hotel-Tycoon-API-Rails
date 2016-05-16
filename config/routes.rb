Rails.application.routes.draw do
  resources :password_resets
  resources :users
  post '/login', to: 'users#login'
end
