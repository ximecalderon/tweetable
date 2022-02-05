Rails.application.routes.draw do
  root to: "tweets#index"
  resources :tweets
  devise_for :users
  resources :users, only: %i[show index]

  post "/tweets/:id/like", to: "tweets#like", as: "like"
  delete "/tweets/:id/like", to: "tweets#like_destroy", as: "like_destroy"
end
