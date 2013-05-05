Finad::Application.routes.draw do

  get "pages/confirm_email"

  # devise_for :adviser_users
  devise_for :adviser_users, :controllers => { :registrations => "registrations", confirmations: 'confirmations' }

  get 'users/email_link'
  resources :users

  root :to => 'users#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :advisers

end
