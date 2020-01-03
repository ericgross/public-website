Rails.application.routes.draw do
  root to: 'concepts#index'
  resources :concepts, only: %i[index show]
end
