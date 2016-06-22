Rails.application.routes.draw do
  patch 'users/:id/attach_role', to: 'users#attach_role'
  patch 'users/:id/detach_role', to: 'users#detach_role'
  resources :bedroom_types, except: [:edit, :new]
  resources :roles, except: [:edit, :new]
  resources :password_resets, except: [:destroy, :show]
  resources :users, except: [:edit, :new] do
    resources :roles, except: [:edit, :new]
  end
  post '/login', to: 'users#login'
end
