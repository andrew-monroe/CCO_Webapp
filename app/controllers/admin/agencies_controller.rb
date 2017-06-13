class Admin::AgenciesController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @amount = 15
    if params[:page].to_i < 0 || params[:page] == nil
      params[:page] = 0
    end
    @agencies = Agency.get_some_agencies(params[:page],@amount)
    if @agencies.count == 0 && params[:page] != 0
      params[:page] = 0
      redirect_to admin_agencies_path
    else
      @agencies
    end
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
