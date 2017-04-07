Rails.application.routes.draw do

  root 'pages#home'

  get    '/about',   to: 'pages#about'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/tasks',   to:  'tasks#index'
  post   '/tasks',   to:  'tasks#create'
  delete '/tasks',   to:  'tasks#destroy'
  
  resources :tasks do
    member do
      get 'complete'
      get 'active_again'
    end
    
    collection do
      post :destroy_multiple
    end
  end

  resources :users do
    member do
      get :confirm_email
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
