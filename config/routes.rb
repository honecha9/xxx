Rails.application.routes.draw do
  devise_for :users
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :users, only: [:edit, :update, :show] do
    resources :profiles, only:[:new, :create, :edit, :update, :show]
  end
  resources :groups, only: [ :index, :new, :create, :destroy ] do
    resources :comments, only: [:index , :new, :create]
  end
end
