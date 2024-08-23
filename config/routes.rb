Rails.application.routes.draw do

  get '/signup', to: 'auth#new'   
  post '/signup', to: 'auth#create'
  
  get '/login', to: 'auth#login_page'   
  post '/login', to: 'auth#login'
  
  get 'home/homepage', to: 'home#homepage', as: 'home_homepage'
  get 'home/profile', to: 'home#profile', as: 'home_profile'
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
