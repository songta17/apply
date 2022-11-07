Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/communes', to: 'communes#index'
  post '/communes', to: 'communes#create'
  get 'communes/:id', to: 'communes#show'
  put 'communes/:id', to: 'communes#update'
end
