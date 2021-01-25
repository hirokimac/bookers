Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :create, :destroy, :edit, :update]
  get 'home/about' => 'homes#about' , as: 'about'
  root 'homes#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end