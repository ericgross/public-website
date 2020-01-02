Rails.application.routes.draw do
  resources :concepts, only: %i[index show]
end
