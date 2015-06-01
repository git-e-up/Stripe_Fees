Rails.application.routes.draw do

  resources :users

  get 'search/api_info'

  post '/sessions' => 'sessions#log_in'
  delete '/sessions' => 'sessions#log_out'

  get '/sign_in' => 'users#sign_in'
  get '/profile' => 'users#profile'

  post '/log_in' => 'sessions#log_in'
  delete '/log_out' => 'sessions#log_out'

  get '/new' => 'users#new'

  get '/api_key' => 'users#api_key'
  post '/api_key' => 'users#api_key'
  delete '/api_key' => 'users#api_key'

  post '/profile' => 'users#api_key'
  get '/profile' => 'users#api_key'

  post '/dates' => 'users#dates'
  get '/dates' => 'users#dates'

  post '/end_dates' => 'users#end_dates'
  get '/end_dates' => 'users#end_dates'


  root 'users#sign_in'
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
