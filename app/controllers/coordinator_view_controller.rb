class CoordinatorViewController < ApplicationController
  before_action :authenticate_coordinator!

  def needs_index
    @needs = current_user.needs.order(:start_date_time)
  end

  def need_show
    @needs = current_user.needs.order(:start_date_time)
  end
end
