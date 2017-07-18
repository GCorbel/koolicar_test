Rails.application.routes.draw do
  resources :rentals, except: :show
end
