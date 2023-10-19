Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      post 'users', to: "users#create"
      patch 'user', to: "users#update"
      delete 'user', to: "users#destroy"
      post 'user', to: "users#login"
      post 'user/adventures', to: "adventures#index"
      post 'user/adventure', to: "adventures#show"
      put 'adventure', to: "adventures#update"
      post 'adventure', to: "adventures#create"
      delete 'adventure', to: "adventures#delete"
    end
  end
end
