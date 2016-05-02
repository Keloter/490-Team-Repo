Rails.application.routes.draw do

  delete 'sessions' => 'sessions#destroy'

  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/settings'

  post'session/login_attempt'

  match ':controller(/:action(/:id))(.:format)', :via => [:get, :post]
  match "signup", :to => "users#new", :via => [:get, :post]
  match "login", :to => "session#login", :via => [:get, :post]
  match "logout", :to => "session#logout", :via => [:get, :post]
  match "home", :to => "session#home", :via => [:get, :post]
  match "profile", :to => "session#profile", :via => [:get, :post]
  match "setting", :to => "session#setting", :via => [:get, :post]

  get 'volunteers/new'
  get 'volunteers/edit'

  get 'stories/index'
  get 'stories/new'
  get 'stories/create'
  get 'stories/edit'
  get 'stories/update'
  get 'stories/destroy'
  get 'stories/show'

  get 'user/index'
  get 'user/login'

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'user#login'

  resources :stories
  resources :uploads
  resources :sessions
  resources :volunteers
  resources :user
  resources :items
  resources :announcements
  resources :documents
  resources :charges

  # get 'donate'

  

  get 'welcome/index'
  get 'documents/pindex'
  get 'volunteer/index'
  get  'about'   => 'volunteer#about'
  get  'contact' => 'volunteer#contact'
  get  'vdonate'  => 'volunteer#vdonate'
  get  'donate'  => 'volunteer#donate'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
