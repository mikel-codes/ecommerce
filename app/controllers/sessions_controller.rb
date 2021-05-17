class SessionsController < ApplicationController
  skip_before_action :authorize_request
  def new
  end

  def create 
    u = User.find_by(username: params[:username])
    if u.try(:authenticate, params[:password])
      session[:user_id] =u.id
      flash[:notice] = "Logged in successfully."
      redirect_to shop_products_url, notice: "You logged in successfully"
    else
      flash[:notice] = "Invalid details."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id]  = nil
    redirect_to login_url, notice: "you logged out"
  end
end
