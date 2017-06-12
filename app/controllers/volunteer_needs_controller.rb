class VolunteerNeedsController < ApplicationController

  def index
    @needs = get_needs.order(:start_date_time)
  end

  def show
    @needs = get_needs.order(:start_date_time)
    @need = Need.find(params[:id])
  end

  private

  def get_needs
    if coordinator_signed_in?
      current_coordinator.needs
    elsif params[:agency_id] != "" && params[:agency_id] != nil
      Agency.find_by(id: params[:agency_id]).needs
    else
      Need.order(:start_date_time)
    end
  end

end
