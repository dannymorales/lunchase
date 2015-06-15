Rails.application.routes.draw do

  resources :ingredients
  resources :lunch_specials
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'lunch_specials#index'

  
end
