Rails.application.routes.draw do
  match "/403", to: "errors#access_denied", via: :all, as: 'error_403'
  match "/404", to: "errors#not_found", via: :all, as: 'error_404'
  match "/500", to: "errors#internal_server_error", via: :all, as: 'error_500'

  # scope "(:locale)", locale: /en|es|eus/ do
  # scope "/:locale" do
  devise_for :users

  scope "/api" do
    get 'get_likes/:id', to: 'api#likes', as: 'get_likes'
    get 'get_place/:id', to: 'api#place', as: 'get_place'
  end

  get 'contact', to: 'messages#contact', as: 'contact'
  post 'contact', to: 'messages#create'
  get 'register', to: 'messages#register', as: 'register'
  post 'register', to: 'messages#register_send'
  get "about_us", to: "static_pages#about_us", as: "about_us"
  get "all_maps", to: "places#maps", as: "all_maps"
  get "map/:id", to: "places#map", as: "map"
  get "search", to: "places#search", as: "search_places"
  post "votes", to: "votes#action", as: "votes_action"

  resources :places do
    resources :items
  end
  
 # WHY!!!!!?????
  resources :items

  namespace :admin do
    resources :places do
      resources :items do
        get "update_year", to: "items#update_year"
      end
    end
    resources :users
  end

  resources :clients
  root 'index#gps'
  get "index", to: "index#index", as: "index"
  # scope "(:locale)", locale: /en|es|eus/ do
  #   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #   # root 'index#index'
  #   get "index"
  # end

  # Error 404 route
  get '*pages', to: 'errors#not_found'
end
