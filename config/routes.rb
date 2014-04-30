BethanyRuthJones::Application.routes.draw do
	get "password_resets/new"
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	resources :password_resets

	root "static_pages#home"
	
	match '/signup',				to: 'users#new',					  via: 'get'
	match '/signin',				to: 'sessions#new',					via: 'get'
	match '/signout',				to: 'sessions#destroy',     via: 'delete'

	match '/placeholder',			to: 'static_pages#placeholder',		via: 'get'
	match '/nested_page',			to: 'static_pages#nested_page',		via: 'get'
	match '/opportunity_vids',		to: 'static_pages#opportunity_vids',   via: 'get'

  match '/resources',    to: 'static_pages#resources',   via: 'get'

  match '/getting_started/place_order',    to: 'static_pages#place_order',   via: 'get'


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
