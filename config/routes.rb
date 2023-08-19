Rails.application.routes.draw do
  devise_for :users, skip: [:confirmations, :mailer, :passwords, :unlocks], controllers: {
    registrations: 'users/registrations',
  }
  root to:'home#index'
  get "/rooms/own/:id", to: "rooms#own"
  get "/reservations/confirm", to: "reservations#confirm"
  resources :rooms, only:[:index, :new, :create, :show]
  resources :reservations, only:[:index, :create]
  resources :users, only:[:show, :edit]
end
