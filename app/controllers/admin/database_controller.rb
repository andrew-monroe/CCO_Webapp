class Admin::DatabaseController < ApplicationController
  before_action :authenticate_admin!

  def destroy_all_needs
    Need.destroy_all
    redirect_to admin_needs_path
  end

  def destroy_all_agencies
    Agency.destroy_all
    redirect_to admin_agencies_path
  end

  def destroy_all_users
    User.destroy_all
    redirect_to admin_users_path
  end

  def destroy_all_coordinators
    Coordinator.destroy_all
    redirect_to admin_coordinators_path
  end
end
