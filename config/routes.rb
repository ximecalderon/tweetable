Rails.application.routes.draw do

  resources :tweets
  
  devise_for :users
  
  post "/tweets/:id/like", to: "tweets#like", as: "like"


end
