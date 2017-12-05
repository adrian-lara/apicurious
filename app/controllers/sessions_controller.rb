class SessionsController < ApplicationController

  def create
    if user = User.return_by_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to user_path
  end

end
