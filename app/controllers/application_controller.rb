class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ProductsHelper
  include CategoriesHelper

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def admin_user
    return if current_user.admin?
    flash[:danger] = t "admin_require"
    redirect_to(root_url)
  end
end
