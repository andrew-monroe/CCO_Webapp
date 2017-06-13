class Admin::NeedsController < ApplicationController
  before_action :authenticate_admin!
  layout 'private'

  def index
    @amount = 15
    if params[:page].to_i < 0 || params[:page] == nil
      params[:page] = 0
    end
    @needs = Need.get_some_needs(params[:page],@amount)
    if @needs.count == 0 && params[:page] != 0
      params[:page] = 0
      redirect_to admin_needs_path
    else
      @needs
    end
  end

  def show
    @need = Need.find(params[:id])
  end
end
