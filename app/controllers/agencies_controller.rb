class AgenciesController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @agencies = Agency.all
  end

  def show
    @agency = Agency.find(params[:id])
  end
end
