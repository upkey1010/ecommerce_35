class CheckoutsController < ApplicationController
  def index
    @user = current_user
    return if @user
    flash[:danger] = t "please_login"
    redirect_to root_path
  end

  def create
    if update_cart order_params
      flash[:success] = t "order_success"
      session[:cart_id] = nil
    else
      flash[:danger] = t "order_error"
    end
    redirect_to root_path
  end

  private

  def order_params
    params.require(:user).permit :name, :phone, :email, :address, :order_statuses_id
  end

  def update_cart params_order
    @cart.update_attributes params_order
  end
end
