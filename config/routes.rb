Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups do
    resource :participations, only: %i[create destroy]
  end
  resources :members
end
