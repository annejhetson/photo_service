PeanutShutter::Application.routes.draw do
  root :to => 'users#index'
  resources :sessions
  resources :users do
    resources :uploads
  end

end
