Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  resources :courses
  resources :activities, only: [:index]
  root to: "static_pages#landing_page"
  get 'privacy_policy', to: "static_pages#privacy_policy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
