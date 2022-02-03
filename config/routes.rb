Rails.application.routes.draw do
  root to: "tweets#index"
  resources :tweets
  post "/tweets/:id/like", to: "tweets#like", as: "like"
  delete "/tweets/:id/like", to: "tweets#like_destroy", as: "like_destroy"
  devise_for :users
end
