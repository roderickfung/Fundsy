Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :campaigns, shallow: true, only: [:new, :create, :show, :index, :destroy] do
    resources :pledges, only: [:create, :destroy] do
      resources :payments, only: [:new, :create]
    end
    resources :publishings, only: [:create]
  end

  # resources pledge, only: [] do
  #   resources :payments, only: [:new, :create]
  # end

  root "campaigns#index"

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
