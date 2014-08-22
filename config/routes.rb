Wefridgerator::Application.routes.draw do
  get "arts/index"
  get "arts/show"
  get "arts/new"
  get "arts/create"
  get "arts/edit"
  get "arts/update"
  get "arts/destroy"
  get "chatrooms/index"
  get "chatrooms/show"
  get "chatrooms/new"
  get "chatrooms/create"
  get "chatrooms/edit"
  get "chatrooms/update"
  get "chatrooms/destroy"
  get "messages/index"
  get "messages/show"
  get "messages/new"
  get "messages/create"
  get "messages/edit"
  get "messages/update"
  get "messages/destroy"
  get "receipts/index"
  get "receipts/show"
  get "receipts/new"
  get "receipts/create"
  get "receipts/edit"
  get "receipts/update"
  get "receipts/destroy"
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/create"
  get "categories/edit"
  get "categories/update"
  get "categories/destroy"
  get "containers/index"
  get "containers/show"
  get "containers/new"
  get "containers/create"
  get "containers/edit"
  get "containers/update"
  get "containers/destroy"
  get "groups/index"
  get "groups/show"
  get "groups/new"
  get "groups/create"
  get "groups/edit"
  get "groups/update"
  get "groups/destroy"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  get "items/index"
  get "items/show"
  get "items/new"
  get "items/create"
  get "items/edit"
  get "items/update"
  get "items/destroy"
  get "shopping_lists/index"
  get "shopping_lists/show"
  get "shopping_lists/new"
  get "shopping_lists/create"
  get "shopping_lists/edit"
  get "shopping_lists/update"
  get "shopping_lists/destroy"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
