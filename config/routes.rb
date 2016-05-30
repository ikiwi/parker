Rails.application.routes.draw do

  resources :users

  resources :spots

  resources :targets

  root 'home#index'

end
