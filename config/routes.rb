Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :survivors, only: [:index, :show, :create] do 
    resource :location, only: [:update]
    resources :reports, only: [:create]
  end
  resources :trade, only: [:create]
end