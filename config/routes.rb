Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'locations#moon_light'

  devise_for :users

  resources :fights, only: [:create, :show] do
    resources :rounds do
      post :hit
    end
  end

  resources :players, only: :show

  resources :resources do
    put :collect
    put :sell_all, on: :collection
  end

  namespace :player do
    resources :stats, only: :index do
      put :increase
    end

    namespace :inventory, path: 'inventory' do
      get :index
      get :equipment
      get :tools
      get :resources
    end

    namespace :settings, path: 'settings' do
      get :index
      get :avatar

      put :change_frame
      put :change_avatar
    end
  end

  namespace :equipment do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      put :buy
      put :put_on
      put :put_off
      put :sell

      collection do 
        put :put_on_all
        put :put_off_all
        put :sell_all
      end
    end
  end

  namespace :artifact do
    resources :categories, only: [:index, :show]
  end

  namespace :tool do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      put :buy
      put :put_on
      put :put_off
      put :sell
    end
  end

  resources :locations, except: :all do
    collection do
      get :moon_light
      get :weapon_shop
      get :craft_shop
      get :shop_of_artifacts
      get :wayward_pines
    end

    resources :cells, only: :show do
      get :move
    end
  end
end
