Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :survivors, only: [:index, :show, :create] do 
    resource :location, only: [:update]
    resources :reports, only: [:create]
  end
  resources :trade, only: [:create]

  scope "/statistics" do
    get "/infected", to: "statistics#infected"
    get "/non_infected", to: "statistics#non_infected"
    get "/resources_average", to: "statistics#resources_average"
    get "/points_lost", to: "statistics#points_lost"
  end
end