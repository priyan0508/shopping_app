Rails.application.routes.draw do
  root "products#index"
  
  devise_for :users
    resources :products do 
      resources :delivery_details      
  end
  
  resources :profiles 
  resources :addresses
  
end
