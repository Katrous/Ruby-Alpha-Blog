Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # creates a route for root route, sends to pages controller which returns a view file
  get 'about', to: 'pages#about'
  # creates a route for the /about url, request is sent to pages controlelr which returns a view file for about
  resources :articles
  # creates routes that work with resources
end
