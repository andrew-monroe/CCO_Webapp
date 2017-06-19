class Admin::AgenciesController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @agencies = Agency.paginate(:page => params[:page])
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
