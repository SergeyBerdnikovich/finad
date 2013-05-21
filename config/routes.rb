Finad::Application.routes.draw do

  resources :counters


  resources :complaints

  get "pages/confirm_email"

  devise_for :adviser_users, :controllers => { :registrations => "registrations", confirmations: 'confirmations' }

  get 'users/email_link'
  resources :users
  match "contact" => "advisers#contact"
  match "zip" => "users#zip"
  match "advisers/featured" => "advisers#featured"
  match "advisers/featured2" => "advisers#featured2"

  match "advisers/register" => "advisers#register"

  root :to => 'advisers#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :advisers

end
