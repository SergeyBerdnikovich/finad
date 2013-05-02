Finad::Application.routes.draw do

  devise_for :adviser_users

  get 'users/email_link'
  resources :users

  root :to => 'users#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :advisers

end
