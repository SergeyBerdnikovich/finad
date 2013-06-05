Finad::Application.routes.draw do

  match "verifications/confirm" => "verifications#confirm"
  resources :verifications, :only => [:new, :create]

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
  match "advisers/contact_form" => "advisers#contact_form", :as => :contact_form
  match "advisers/contact_question" => "advisers#contact_question", :as => :contact_question
  match "advisers/consultation" => "advisers#consultation", :as => :consultation

  match "advisers/register" => "advisers#register"
  match "advisers/find_adviser" => "advisers#find_adviser"
  match "advisers/check_adviser" => "advisers#check_adviser"
  match "advisers/set_adviser/:id" => "advisers#set_adviser", :as => :set_adviser
  match "advisers/alphabet" => "advisers#alphabet", :as => :alphabet_advisers

  root :to => 'advisers#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :advisers

end
