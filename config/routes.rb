Rails.application.routes.draw do
  root to: 'concepts#show', id: '5e113559623562004d000064'
  resources :concepts, only: %i[index show]
end
