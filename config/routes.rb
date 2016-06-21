Rails.application.routes.draw do
  patch 'users/:id/attach_role', to: 'users#attach_role'
  patch 'users/:id/detach_role', to: 'users#detach_role'
  resources :bedroom_types, except: [:edit, :new]
  resources :roles
  resources :password_resets
  resources :users do
    resources :roles
  end
  post '/login', to: 'users#login'
end
