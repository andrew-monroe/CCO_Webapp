class NeedsController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @needs = Need.all
  end

  def show
    @need = Need.find(params[:id])
  end
end
