Rails.application.routes.draw do

  resources :users

  resources :spots

  resources :targets

  delete 'spots' => 'spots#destroy'

  root 'home#index'

end
