class UsersController < ApplicationController

  def show
    @user = GithubUser.new(params[:user_name])
  end

end
