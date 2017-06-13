class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @amount = 15
    if params[:page].to_i < 0 || params[:page] == nil
      params[:page] = 0
    end
    @users = User.get_some_users(params[:page],@amount)
    if @users.count == 0 && params[:page] != 0
      params[:page] = 0
      redirect_to admin_users_path
    else
      @users
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
