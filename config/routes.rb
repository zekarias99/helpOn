Helpon::Application.routes.draw do

  root  'static_pages#home'
  get "users/new"
  resources :sessions, only: [:new, :create, :destroy]
  resources :statuses
  resources :friendships

  match 'feed',       to: 'statuses#index',       via: 'get'

  match '/signin',    to: 'sessions#new',         via: 'get'
   match '/signout',  to: 'sessions#destroy',     via: 'delete'
  resources :deals, :fine_prints, :highlights, :companies, :charities, 
            :cities, :states, :locations, :users
  # get   'deals/:id' =>  'deals#show', as: 'deal'
  # get   'deals/:id/edit' =>  'deals#edit', as: 'edit_deal'
  # patch 'deals/:id' =>  'deals#update'
  match 'help',         to: 'static_pages#help',         via: 'get'
  match 'about',        to: 'static_pages#about',        via: 'get'
  match 'contact',      to: 'static_pages#contact',      via: 'get' 
  match 'how_it_works', to: 'static_pages#how_it_works', via: 'get' 
  # match '/:city_name',  to: 'deals#show',                via: 'get'
  # match '*path',        to: 'static_pages#index',        via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'

    resources :friendships do
      member do
        put :accept
      end
    end
  get "profiles/show"
  match '/:id',       to: 'profiles#show',        via: 'get'
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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
