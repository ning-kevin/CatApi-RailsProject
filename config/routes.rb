Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cats do 
    resources :toys, only: [:index, :new]
  end

  resources :toys, only: [:create, :update, :destroy, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do 
    resources :counter, only: [:update]
  end

  root to: redirect("/cats")

end
