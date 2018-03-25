class UsersController < ApplicationController

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: "Access denied."
  end
  load_and_authorize_resource only: [:destroy, :show]


  def index
    @users = User.all
  end

  def show
    # binding.pry
    authorize! :read, @user

  end

  def destroy
    if current_user.admin?
      current_user.destroy
    end
      redirect_to '/'
  end
end