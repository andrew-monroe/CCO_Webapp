class VolunteerNeedsController < ApplicationController

  def index
    @needs = get_needs
  end

  def show
    @needs = get_needs
    @need = Need.find(params[:id])
  end

  private

  def get_needs
    if coordinator_signed_in?
      sort_needs(agency_specific_needs(current_coordinator.needs))
    else
      sort_needs(agency_specific_needs(Need.all))
    end
  end

  def sort_needs(need_set)
    if need_set != nil
      need_set.order(:start_date_time)
    else
      []
    end
  end

  def agency_specific_needs(need_set)
    if params[:agency_id].to_s != ""
      need_set.where(agency_id: params[:agency_id])
    else
      need_set
    end
  end

end
