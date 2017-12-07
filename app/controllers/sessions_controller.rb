class SessionsController < ApplicationController

  def create
    if user = User.return_by_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

end
