Rails.application.routes.draw do
  root to: 'pages#home'
  get '/park', to: 'pages#park'
  get '/second', to: 'pages#second_page'
  resources :greenspaces,  only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
