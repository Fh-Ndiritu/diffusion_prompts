Rails.application.routes.draw do
  
  get 'split/:id', to: "split#show", as: :split
  get 'dataset/:id', to: "datasets#show", as: :dataset
  get 'datasets', to: 'datasets#index', as: :datasets

  get 'search_prompts', to: "search#prompts", as: :search_prompts
  resources :prompts, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "datasets#index"
end
