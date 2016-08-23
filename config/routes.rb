Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campaigns, only: [:new, :create, :show, :index, :destroy] do
    resources :pledges, only: [:create, :destroy]
  end
  root "campaigns#index"
end
