Rails.application.routes.draw do
  resources :sessions, only: :create
  resources :hotels only: %i[index create show destroy]
  resources :favorites only: %i[index create show destroy]
  resources :registrations, only: :create
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
