Rails.application.routes.draw do
  resources :rentals, except: :show

  root 'rentals#index'
end
