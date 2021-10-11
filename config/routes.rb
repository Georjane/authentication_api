Rails.application.routes.draw do
  resources :sessions, only: %i[create destroy]
  resources :hotels, only: %i[index create show destroy]
  resources :favorites, only: %i[index create]
  resources :registrations, only: :create
  match '/logout', to: 'sessions#destroy', via: :delete
end
