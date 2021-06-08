Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :posts do
    resources :favorites,only: [:create, :destroy]

    resources :post_comments, only: [:create, :destroy]
  end

end
