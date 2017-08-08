Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  scope format: true, constraints: { format: 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"

    resource :users, only: [:create]
    resources :menus, only: [:create, :index]
    resources :votes, only: [:create, :index]
  end
end
