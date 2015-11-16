Rails.application.routes.draw do
  mount Buttercms::Engine => '/blog'
  root 'blog#index'
end
