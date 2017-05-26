class NeedsController < ApplicationController
  def index
    @need = Need.all
  end

  def show
      @need = Need.find(params[:id])
  end

  def new

  end

  def create
    @need = Need.new(need_params)
    @need.save
    redirect_to @need
  end

  def edit
    @need = Need.find(params[:id])
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    redirect_to needs_path
  end

  private
  def need_params
    params.require(:need).permit(:title,:description)
  end
end
