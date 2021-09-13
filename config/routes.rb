Rails.application.routes.draw do
  resources :diary_entry_records
  devise_for :users
  resources :friends
  #get 'home/index'
  get 'home/about'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
