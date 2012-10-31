Almacen::Application.routes.draw do

  get "stockms/new" => "stockm#new", :as => 'new_stockm'

  get "stockms/:id/edit" => "stockm#edit", :as => 'edit_stockm'

  get "stockms/:id" => "stockm#show", :as => 'stockm'

  get "stock_ms" => "stockm#index"

  post "stock_ms" => 'stockm#create'

  put "stock_ms/:id" => 'stockm#update'

  delete "stock_ms/:id" => 'stockm#destroy', :as =>'stockdelete'

  devise_for :admins

  get "pagehome/home"

  get "pagehome/users"

  get "pagehome/users/:id/edit" => 'pagehome#edit', :as => 'edit'

  put "pagehome/users/:id" => 'pagehome#block'

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

  resources :moves
  resources :products

  get "branches/:branch_id/orders/provision" => 'orders#provision', :as=>'provision' do
    resources :order_details
  end

  get "branches/:branch_id/orders/stock" => 'orders#stock', :as=>'stock' do
    resources :order_details
  end

  resources :branches do
    resources :orders do
      resources :order_details
      get :autocomplete_products_search, :on => :collection
    end
    post "/stock" => 'orders#create_stock'
    post "/provision" => 'orders#create_prov'
    get "/orders/:id/mov" => 'orders#new_mov', :as => 'mov_prod'
    get "/report" => 'orders#reports', :as => 'report_day'
    get "/date_reports" => 'orders#date_reports', :as => 'date_reports'
 end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'pagehome#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
