Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :statuses do
    resources :graphs
  end
  resources :statuses
end
