Rails.application.routes.draw do
  resources :images
  resources :resource_tags
  resources :tags
  resources :resources
  root 'resources#index'
end
