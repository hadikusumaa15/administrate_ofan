Rails.application.routes.draw do
  # resources :tasks
  # resources :statuses
  namespace :admin do
    resources :tasks
    resources :statuses
  end
  root :to => 'admin/tasks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
