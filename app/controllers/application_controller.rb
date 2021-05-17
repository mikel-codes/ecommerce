class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :authorize_request

    private
    def authorize_request
        unless User.find_by(id: session[:user_id])
            redirect_to login_url, notice: "Please log in to Continue"
        end
    end
end
