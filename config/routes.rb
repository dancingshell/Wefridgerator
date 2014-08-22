Wefridgerator::Application.routes.draw do
  root 'users#new'

  resources :users
  resources :shopping_lists

  resources :groups do
    resources :containers
  end

  resources :containers do
    resources :categories
  end

  resources :categories do
    resources :items 
  end

  resources :groups do
    resources :receipts
  end

  resources :groups do
    resources :chat_rooms
  end

  resources :chat_rooms do
    resources :messages
  end

  resources :conatiners do
    resources :arts
  end

end
