Rails.application.routes.draw do
  root 'states#index'

  namespace :api do
    resources :states, only: :index
    resources :cities, param: :slug,  only: %i[index show]
  end
end
