class VolunteerNeedsController < ApplicationController
  
  def index
    if params[:agency_id] != nil
      @needs = Agency.find_by(galaxy_id: params[:agency_id]).needs.order(:start_date_time)
    else
      @needs = Need.order(:start_date_time)
    end
  end

  def show
    @needs = Need.order(:start_date_time)
    @need = Need.find(params[:id])
  end

  private
  def need_params
    params.require(:need).permit(:title,:description,:agency,:location,:time,:volunteers_needed,:volunteers_signed_up)
  end
end
