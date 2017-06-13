class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    if @users = User.get_some_users(params[:page])
      @users
    else
      @users = get_some_users
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
