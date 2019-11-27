Rails.application.routes.draw do
  root to: 'pages#home'
  get '/park', to: 'pages#park'
  get '/map2', to: 'pages#map2'
  # get '/greenspaces', to: 'pages#greenspaces'
  resources :greenspaces,  only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
