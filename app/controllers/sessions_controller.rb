class SessionsController < ApplicationController
  skip_before_action :authorize_request
  def new
  end

  def create 
    u = User.find_by(username: params[:username])
    if u.try(:authenticate, params[:password])
      session[:user_id] =u.id
      flash[:notice] = "Logged in successfully."
      redirect_back(fallback_location: "/",allow_other_hosts: false)
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
