Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Basic app routes
  root "flights#index"
  resources :flights, only: [ :index, :show ]
  resources :bookings, only: [ :new, :create, :show ]
  resources :payments, only: [ :show ]

  # Admin panel routes
  resources :airports, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # PAYMENTS SANDBOX - custom route
  get "payments/approve/:id" => "payments#approve_payment", :as => "approve_payment"

  # ROOT FOR SIGNED-IN ADMIN
  get "admin_root" => "airports#index"
end
