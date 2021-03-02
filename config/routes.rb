Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  devise_for :users

  resources :blogs do
      resources :comments
  end

  resources :comments do
      resources :comments
  end
end
