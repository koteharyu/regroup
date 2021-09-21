Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#index'
  resources :groups do
    resource :participations, only: %i[create destroy]
    resource :roles, only: %i[update]
  end
  resources :members
end
