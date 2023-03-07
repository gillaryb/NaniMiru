Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :parties, only: %i[index new create show] do
    resources :swipes, only: %i[create]
    member do
      get 'swipe', to: 'parties#swipe'
    end
    resources :movies, only: %i[index]
  end
  resources :swipes, only: %i[show]
end
