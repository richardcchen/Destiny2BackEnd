Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :manifest do
        resources :classtypes, only: [:index]
        resources :damagetypes, only: [:index]
        resources :genders, only: [:index]
        resources :damagetypes, only: [:index]
        resources :inventorybuckets, only: [:index]
        resources :inventoryitems, only: [:index]
        resources :itemtiertypes, only: [:index]
        resources :perks, only: [:index]
        resources :races, only: [:index]
        resources :stats, only: [:index]
        resources :itemstats, only: [:index]
      end
      get '/users/login', to: 'users#login'
      get '/users/loginAuth', to: 'users#loginAuth'
      get '/users/token', to: 'users#token'
      post '/users/login', to: 'users#login'
      post 'items/getItems', to: 'items#getItems'
      post 'items/getVault', to: 'items#getVault'
      get 'users/receivedToken', to: 'users#receivedToken'
      post 'users/addFriend', to: 'users#addFriend'
      post 'users/getFriends', to:'users#getFriends'
      post 'items/leaveComment', to: 'items#leaveComment'
      post 'users/feed', to: 'users#feed'
    end
  end
end

# post '/user/login', to: 'users#login'
# post '/user/signup', to: 'users#signup'
#
# post '/videos/like', to: 'videos#like'
# get '/videos/:id/likes', to: 'videos#likes'
