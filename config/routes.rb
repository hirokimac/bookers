Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end
  resources :books, only: [:show, :index, :create, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about' , as: 'about'
  root 'homes#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
