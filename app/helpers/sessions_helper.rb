module SessionsHelper
  def current_user? user
    user == current_user
  end

  def log_in user
    session[:user_id] = user.id
    set_cart_id
  end

  def set_cart_id
    @cart = current_user.orders.find_by status: "in_progress"
    session[:cart_id] = @cart.id if @cart.present?
  end
end
