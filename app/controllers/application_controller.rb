class ApplicationController < ActionController::Base
	
  protect_from_forgery
  def after_sign_in_path_for(resource)
    advisers_find_adviser_path
  end
  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'
end