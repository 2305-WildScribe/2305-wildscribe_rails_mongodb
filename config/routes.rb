Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      namespace :user do
        resources :adventures
      end
      post 'user', to: "users#create"
      patch 'user', to: "users#update"
      delete 'user', to: "users#destroy"
      post 'login', to: "users#login"
    end
  end
end
