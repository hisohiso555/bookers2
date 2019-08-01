Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
  	resources :book_comments, only: [:create, :edit, :update, :destroy]
  	resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
end
