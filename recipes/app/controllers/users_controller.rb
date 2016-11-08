class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  
end
