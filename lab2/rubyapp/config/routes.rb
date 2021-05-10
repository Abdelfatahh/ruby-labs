Rails.application.routes.draw do
  resources :items
  devise_for :users
  root to: 'welcome#index'
  get 'welcome/index'
  post 'auth_user' => 'authentication#authenticate_user'
  # get '/*a', to: 'application#not_found'
  # post 'authenticate', to: 'authentication#authenticate'
  resources :articles do 
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
