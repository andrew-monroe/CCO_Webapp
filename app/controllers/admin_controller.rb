class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = Coordinator.all
  end

  def show
    @user = Coordinator.find(params[:id])
  end

  def create
    @user = Coordinator.new(coordinator_params)
    @user.save
    redirect_to admin_path
  end

  def new
  end

  def edit
    @user = Coordinator.find(params[:id])
  end

  def destroy
    @user = Coordinator.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def coordinator_params
    params.require(:coordinator).permit(:first_name,:last_name,:email)
  end
end
