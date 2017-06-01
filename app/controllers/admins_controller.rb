class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @coordinators = Coordinator.all
  end

  def show
    @coordinator = Coordinator.find(params[:id])
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)
    @coordinator.save
    redirect_to admin_path
  end

  def new
  end

  def edit
    @coordinator = Coordinator.find(params[:id])
  end

  def destroy
    @coordinator = Coordinator.find(params[:id])
    @coordinator.destroy
    redirect_to admin_path
  end

  private
  def coordinator_params
    params.require(:coordinator).permit(:first_name,:last_name,:email)
  end
end
