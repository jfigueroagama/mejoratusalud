class UsersController < ApplicationController
  # AplicationController inherits from AplicationController::Base
  # UsersController inherits from AplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to de Sample App!"
      redirect_to @user # user_path
    else
      render 'new'
    end
  end
end
