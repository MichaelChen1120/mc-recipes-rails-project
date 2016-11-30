Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  resources :users do
    resources :recipes
    resources :comments
  end
  resources :ingredients
  resources :recipes do
    resources :ingredients, only: [:show, :index, :new]
  end

end
