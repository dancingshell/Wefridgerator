Wefridgerator::Application.routes.draw do
  root 'users#new'

  resources :users

  resource :session, only: [:new, :create, :destroy]
  resources :shopping_lists

  get "categories/api/"  => "categories#nothing"
  get "categories/api/:s" => "categories#check_anagram"

  resources :groups do
    resources :user_groups, only:[:new, :create]
    resources :containers
    resources :receipts
    resources :chat_rooms
  end

  resources :containers do
    resources :categories
    resources :arts
  end

  resources :categories do
    resources :items 
  end

  resources :chat_rooms do
    resources :messages
  end

end
