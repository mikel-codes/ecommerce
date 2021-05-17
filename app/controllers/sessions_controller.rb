class SessionsController < ApplicationController
  def new
  end

  def create 
    u = User.find_by(username: params[:username])
    if u.try(:authenticate, params[:password])
      session[:user_id] =u.id
      redirect_to admin_url, notice: "log in successfull"
    else
      redirect_to login_url, notice: "Invalid username and password"
      
    end
  end

  def destroy
    session[:user_id]  = nil
    redirect_to login_url, notice: "you logged out"
  end
end
