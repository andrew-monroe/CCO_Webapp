class VolunteerNeedsController < ApplicationController
  before_action :authenticate_coordinator!, except: [:index, :show]

  def index
    if params[:agency_id] != nil
      @needs = Need.where(agency_id: params[:agency_id])
    else
      @needs = Need.all
    end
  end

  def show
    @needs = Need.all
    @need = Need.find(params[:id])
  end

  private
  def need_params
    params.require(:need).permit(:title,:description,:agency,:location,:time,:volunteers_needed,:volunteers_signed_up)
  end
end
