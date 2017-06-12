class AgenciesController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @agencies = Agency.all.order(:name)
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
