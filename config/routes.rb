Rails.application.routes.draw do

resources :fans, only: [:new, :create]
resource :session, only: [:new, :create, :destroy]

namespace :api, defaults: {format: :json} do
  resources :fans, only: [:create, :index, :show, :update, :destroy]
  resources :venues, only: [:create, :index, :show, :update, :destroy]
  resources :bands, only: [:create, :index, :show, :update, :destroy] do
    resources :songs, only: [:create, :index, :show, :update, :destroy]
    resources :albums, only: [:create, :index, :show, :update, :destroy]
    end
  resources :gigs, only: [:create, :index, :show, :update, :destroy]
  resources :images, only: [:create, :index, :show, :update, :destroy]
  resources :press_items, only: [:create, :index, :show, :update, :destroy]
  end

  root "static_pages#root"

end
