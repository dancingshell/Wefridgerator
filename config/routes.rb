Wefridgerator::Application.routes.draw do
  root 'users#new'

  resources :users

  resource :session, only: [:new, :create, :destroy]

  resources :static_pages 


  get "categories/:id/items/new_item" => "items#new_container_item", as: :new_container_item
  get "categories/:id/items/new_sl" => "items#new_shopping_list_item", as: :new_shopping_list_item
  get "categories/api/"  => "categories#nothing"
  get "categories/api/:s" => "categories#check_anagram"

  resources :groups do
    resources :user_groups
    resources :containers
    resources :receipts
    resources :chat_rooms
  end

  resources :containers do
    resources :categories
    resources :arts
  end

  resources :categories do
    resources :items, only: [:index, :show, :create, :edit , :update, :destroy]
  end

  resources :chat_rooms do
    resources :messages
  end

end
