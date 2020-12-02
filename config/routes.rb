Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #root to: 'articles#new'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
end
