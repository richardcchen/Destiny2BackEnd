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
    end
  end
end
