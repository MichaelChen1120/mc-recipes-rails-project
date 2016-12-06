Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  resources :users do
    resources :reviews
    resources :recipes do
      resources :ingredients, only: [:show, :index, :new]
      resources :reviews
    end
  end
  resources :ingredients
  resources :recipes, only: [:show]
  resources :reviews, only: [:show]

end
