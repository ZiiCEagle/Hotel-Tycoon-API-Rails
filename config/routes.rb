Rails.application.routes.draw do
  patch 'users/:id/attach_role', to: 'users#attach_role'
  resources :roles
  resources :password_resets
  resources :users do
    resources :roles
  end
  post '/login', to: 'users#login'
end
