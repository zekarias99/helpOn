Helpon::Application.routes.draw do


  get "users/index"
  root  'static_pages#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

   resources :users do
      resources :pictures
  end


  resources :users do
    member do
      get :joining, :joiners
    end
  end

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',    to: 'sessions#new',         via: 'get'
  match '/signout',  to: 'sessions#destroy',     via: 'delete'

  resources :deals, :fine_prints, :highlights, :companies, :charities, 
            :cities, :states, :locations
  # get   'deals/:id' =>  'deals#show', as: 'deal'
  # get   'deals/:id/edit' =>  'deals#edit', as: 'edit_deal'
  # patch 'deals/:id' =>  'deals#update'
  match 'help',         to: 'static_pages#help',         via: 'get'
  match 'about',        to: 'static_pages#about',        via: 'get'
  match 'contact',      to: 'static_pages#contact',      via: 'get' 
  match 'how_it_works', to: 'static_pages#how_it_works', via: 'get' 
  # match '/:city_name',  to: 'deals#show',                via: 'get'
  # match '*path',        to: 'static_pages#index',        via: 'get'
end
