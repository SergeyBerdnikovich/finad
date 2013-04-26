Finad::Application.routes.draw do

  resources :users


  root :to => 'users#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :advisers

end
