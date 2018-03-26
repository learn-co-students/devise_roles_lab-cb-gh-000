class UsersController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @user.destroy
    redirect_to root_path
  end

  def show
    redirect_to root_path, :alert => "User Access denied." unless current_user.try(:id) == params[:id]
    @user = User.find(params[:id])
  end

end
