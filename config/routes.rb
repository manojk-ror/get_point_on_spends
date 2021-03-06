Rails.application.routes.draw do
  resources :spends
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_scope :user do 
  	root to: "devise/registrations#new"
  end
  resources :users, only: [:index]
end
