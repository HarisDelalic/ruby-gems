Rails.application.routes.draw do
  resources :enrollments
  # resources :lessons
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :courses do
    resources :enrollments, only: [:new, :create]
    resources :lessons
  end
  resources :activities, only: [:index]
  root to: "static_pages#landing_page"
  get 'privacy_policy', to: "static_pages#privacy_policy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
