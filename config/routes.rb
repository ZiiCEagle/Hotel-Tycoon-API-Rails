Rails.application.routes.draw do
  resources :roles
  resources :password_resets
  resources :users do
    resources :roles
  end
  post '/login', to: 'users#login'
end
