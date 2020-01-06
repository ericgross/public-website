Rails.application.routes.draw do
  root to: 'concepts#show', id: Rails.application.credentials.fetch(:root_id)
  resources :concepts, only: %i[index show]
end
