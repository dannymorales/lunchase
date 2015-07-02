Rails.application.routes.draw do

  resources :locations
  resources :lunch_specials
  resources :restaurants, shallow: true do  
    resources :lunch_specials, except: :index do
    	member do
        put "like", to: "lunch_specials#upvote"
  		  put "dislike", to: "lunch_specials#downvote"
    	end
      resources :ingredients
   	 end
  end
 
  devise_for :users, controllers:{registration: "my_registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  
  root 'locations#new'



  
end
