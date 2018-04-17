class UsersController < ApplicationController

  def show
    redirect_to root_path, :alert => "User Access denied." unless current_user.try(:id) == params[:id]
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end
end
