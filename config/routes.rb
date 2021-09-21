Rails.application.routes.draw do
  resources :sessions, only: :create
  resources :hotels, only: %i[index create show destroy]
  resources :favorites, only: %i[index create show destroy]
  resources :registrations, only: :create
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
end
