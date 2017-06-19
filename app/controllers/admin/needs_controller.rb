class Admin::NeedsController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @needs = Need.order(:start_date_time).paginate(:page => params[:page])
  end

  def show
    @need = Need.find(params[:id])
  end
end
