Rails.application.routes.draw do
  resources :concepts, only: [:index]
end
