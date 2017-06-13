class Admin::NeedsController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @needs = Need.all.order(:start_date_time)
  end

  def show
    @need = Need.find(params[:id])
  end
end
