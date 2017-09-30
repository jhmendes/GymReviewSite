Rails.application.routes.draw do
  devise_for :users
 # routes for gyms and reviews add here
  resources :gyms do
    resources :reviews 
  end


  # resources :gyms do
  #   resources :reviews do
  #     resources :users
  #   end
  # end
  # resources :reviews do
  #   resources :users
  # end

  root "gyms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
