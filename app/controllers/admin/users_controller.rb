class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @users = User.order(:last_name).paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
