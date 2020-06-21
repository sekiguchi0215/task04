Rails.application.routes.draw do


  root to: 'homes#index'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :show, :update]

  resources :books do
  	resources :post_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  get 'index' => 'homes#index'

  get 'home/about' => 'homes#about'

end
