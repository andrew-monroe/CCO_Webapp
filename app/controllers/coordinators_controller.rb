class CoordinatorsController < ApplicationController
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
      redirect_to coordinators_path, notice: "Good job"
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
    redirect_to coordinators_path
  end

  def destroy
    @coordinator = Coordinator.find(params[:id])
    @coordinator.destroy
    redirect_to coordinator_path
  end

  private
  def coordinator_params
    params.require(:coordinator).permit(:first_name,:last_name,:email,:password,agency_ids:[])
  end
end
