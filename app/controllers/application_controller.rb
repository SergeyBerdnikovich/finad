class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    if params[:admin_user]
      admin_dashboard_path
    else
      advisers_find_adviser_path
    end
  end
  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'
end