class NeedsController < ApplicationController
  before_action :authenticate_coordinator!, except: [:index, :show]

  def index
    @needs = Need.all
  end

  def show
    @needs = Need.all
    @need = Need.find(params[:id])
  end

  def new
    @needs = Need.all
  end

  def create
    @need = Need.new(need_params)
    @need.save
    redirect_to @need
  end

  def edit
    @needs = Need.all
    @need = Need.find(params[:id])
  end

  def destroy
    @needs = Need.all
    @need = Need.find(params[:id])
    @need.destroy
    redirect_to needs_path
  end

  private
  def need_params
    params.require(:need).permit(:title,:description,:agency,:location,:start_time,:end_time,:volunteers_needed,:volunteers_signed_up)
  end
end
