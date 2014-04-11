PeanutShutter::Application.routes.draw do
  root :to => 'users#index'
  resources :sessions
  resources :users do
    resources :uploads
  end
  resources :tags
  resources :likes

  match('users', {:via => :get, :to => 'users#index'})

end
