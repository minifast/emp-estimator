Rails.application.routes.draw do
  resources :metals
  resources :estimates, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "estimates#new"
end
