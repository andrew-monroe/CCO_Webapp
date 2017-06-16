class Admin::CoordinatorsController < ApplicationController
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
    if @coordinator.save
      @coordinator.invite!
      redirect_to admin_coordinators_path, notice: "Good job"
    else
      render action: "new"
    end
  end

  def new
    @coordinator = Coordinator.new
  end

  def edit
    @coordinator = Coordinator.find(params[:id])
  end

  def update
    @coordinator = Coordinator.find(params[:id])
    @coordinator.update(coordinator_params)
    redirect_to admin_coordinators_path
  end

  def destroy
    @coordinator = Coordinator.find(params[:id])
    @coordinator.destroy
    redirect_to admin_coordinators_path
  end

  def password_reset
    @coordinator = Coordinator.find(params[:id])
    @coordinator.send_reset_password_instructions
    redirect_to admin_coordinator_path(@coordinator)
  end

  private
  def coordinator_params
    params.require(:coordinator).permit(:first_name,:last_name,:email,:password,agency_ids:[])
  end
end
