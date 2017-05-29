class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def new
  end

  def edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:ku_id,:email,:admin,:moderator_for)
  end
end
