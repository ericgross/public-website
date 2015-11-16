Rails.application.routes.draw do
  mount Buttercms::Engine => '/blog'
  root 'high_voltage/pages#show', id: 'home'
end
