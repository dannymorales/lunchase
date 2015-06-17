Rails.application.routes.draw do

  resources :restaurants
  resources :ingredients
  resources :lunch_specials
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers:{registration: "my_registrations", omniauth_callbacks: "users/omniauth_callbacks"}

  root 'lunch_specials#index'

  
end
